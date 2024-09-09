import 'package:flutter/material.dart';
import 'package:flutter_mool/home/screens/filter_screen.dart';

class CustomFilterBottomAppBar extends StatefulWidget {
  const CustomFilterBottomAppBar({Key? key}) : super(key: key);

  @override
  _CustomFilterBottomAppBarState createState() =>
      _CustomFilterBottomAppBarState();
}

class _CustomFilterBottomAppBarState extends State<CustomFilterBottomAppBar> {
  String _sortValue = 'SORT';

  void _updateSortValue(String value) {
    setState(() {
      _sortValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SortModal(
                    onSortSelected: _updateSortValue,
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sort, color: Colors.grey[700]),
                  SizedBox(width: 8),
                  Text(
                    _sortValue,
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 2,
            height: 30,
            color: Colors.grey[600],
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list, color: Colors.grey[700]),
                  SizedBox(width: 8),
                  Text(
                    'FILTER',
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SortModal extends StatefulWidget {
  final Function(String) onSortSelected;

  const SortModal({Key? key, required this.onSortSelected}) : super(key: key);

  @override
  _SortModalState createState() => _SortModalState();
}

class _SortModalState extends State<SortModal> {
  String _selectedOption = 'Price: High to Low';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sorting',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Price: High to Low'),
            leading: Radio<String>(
              value: 'Price: High to Low',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
                widget.onSortSelected(value!);
              },
            ),
          ),
          ListTile(
            title: Text('Price: Low to High'),
            leading: Radio<String>(
              value: 'Price: Low to High',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
                widget.onSortSelected(value!);
              },
            ),
          ),
          ListTile(
            title: Text('New Arrival'),
            leading: Radio<String>(
              value: 'New Arrival',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
                widget.onSortSelected(value!);
              },
            ),
          ),
          ListTile(
            title: Text('Rating: High to Low'),
            leading: Radio<String>(
              value: 'Rating: High to Low',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
                widget.onSortSelected(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
