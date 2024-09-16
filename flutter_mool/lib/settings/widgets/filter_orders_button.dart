import 'package:flutter/material.dart';
import 'package:flutter_mool/settings/screens/your_orders_screen.dart';

class FilterOrdersButton extends StatelessWidget {
  const FilterOrdersButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return const FilterOptionsSheet();
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'Filter',
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
        ],
      ),
    );
  }
}

class FilterOptionsSheet extends StatefulWidget {
  const FilterOptionsSheet({Key? key}) : super(key: key);

  @override
  _FilterOptionsSheetState createState() => _FilterOptionsSheetState();
}

class _FilterOptionsSheetState extends State<FilterOptionsSheet> {
  String _selectedOption = 'This Month';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter Orders',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildFilterOption('This Month'),
          _buildFilterOption('Last 6 months'),
          _buildFilterOption('Last Year'),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String text) {
    final isSelected = _selectedOption == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = text;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.green : Colors.transparent,
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.check, size: 16, color: Colors.white),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
