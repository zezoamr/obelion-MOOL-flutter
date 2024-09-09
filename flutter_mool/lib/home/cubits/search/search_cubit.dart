import 'package:flutter_bloc/flutter_bloc.dart';

class SearchState {
  final List<String> recentSearches;
  final List<String> topSearches;
  final List<String> searchResults;

  SearchState({
    required this.recentSearches,
    required this.topSearches,
    required this.searchResults,
  });

  SearchState copyWith({
    List<String>? recentSearches,
    List<String>? topSearches,
    List<String>? searchResults,
  }) {
    return SearchState(
      recentSearches: recentSearches ?? this.recentSearches,
      topSearches: topSearches ?? this.topSearches,
      searchResults: searchResults ?? this.searchResults,
    );
  }
}

class SearchCubit extends Cubit<SearchState> {
  final List<String> _mockData = [
    'Zara Tops',
    'Zara Dresses',
    'Polo Shirts',
    'Polo Pants',
    'Tops for Women',
    "Men's Polo",
    'Zara Jeans',
    'Polo Hoodies',
    'Zara Shoes',
    'Tops for Men',
  ];

  SearchCubit()
      : super(SearchState(
          recentSearches: ['Polo', 'ZARA'],
          topSearches: ['Tops', 'Polo', 'ZARA'],
          searchResults: [],
        ));

  void addRecentSearch(String searchQuery) {
    final updatedRecentSearches = List<String>.from(state.recentSearches);
    if (!updatedRecentSearches.contains(searchQuery)) {
      updatedRecentSearches.add(searchQuery);
      emit(state.copyWith(recentSearches: updatedRecentSearches));
    }
  }

  void search(String query) {
    final results = _mockData
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(state.copyWith(searchResults: results));
  }

  void resetSearch() {
    emit(SearchState(
      recentSearches: state.recentSearches,
      topSearches: state.topSearches,
      searchResults: [],
    ));
  }
}
