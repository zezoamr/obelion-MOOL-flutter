import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mool/cubits/search/search_cubit.dart';

// WillPopScope(
//       onWillPop: () async {
//         searchCubit.resetSearch();
//         return true;
//       },

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          searchCubit.resetSearch();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'What are you looking for?',
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              searchCubit.search(value);
            },
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                searchCubit.addRecentSearch(value);
              }
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  // Conditionally render Top and Recent Searches if there are no search results
                  if (state.searchResults.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Top Searches',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: state.topSearches.map((item) {
                            return ElevatedButton(
                              onPressed: () {
                                searchCubit.addRecentSearch(item);
                                searchCubit.search(item);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300],
                                foregroundColor: Colors.black,
                              ),
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 20),
                        Text('Recent Searches',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.recentSearches.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(state.recentSearches[index]),
                              onTap: () {
                                searchCubit.search(state.recentSearches[index]);
                              },
                              trailing: Icon(Icons.arrow_forward_ios, size: 16),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: 20),
              Text('Search Results',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state.searchResults.isEmpty) {
                      return Center(child: Text('No results found.'));
                    }
                    return ListView.builder(
                      itemCount: state.searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.searchResults[index]),
                          onTap: () {},
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
