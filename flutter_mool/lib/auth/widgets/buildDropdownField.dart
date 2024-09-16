import 'package:flutter/material.dart';

Widget buildDropdownField(BuildContext context, String label,
    String selectedValue, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedValue,
            style: TextStyle(
              color: selectedValue == label ? Colors.grey : Colors.black,
            ),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
    ),
  );
}

void showCountrySelector(BuildContext context, String selectedCountry,
    Function(String) selectCountry) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Country',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            buildCountryOption(
                'Saudi Arabia',
                selectedCountry == 'Saudi Arabia',
                () => selectCountry('Saudi Arabia')),
            buildCountryOption(
                'UAE', selectedCountry == 'UAE', () => selectCountry('UAE')),
            buildCountryOption('Egypt', selectedCountry == 'Egypt',
                () => selectCountry('Egypt')),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text('Continue', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    },
  );
}

Widget buildCountryOption(String country, bool isSelected, Function() onTap) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    child: ListTile(
      title: Text(country),
      leading: Image.asset(
        'assets/images/flags/${country.toLowerCase().replaceAll(' ', '_')}.png',
        width: 30,
        height: 20,
      ),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Icon(Icons.circle_outlined, color: Colors.grey),
      onTap: onTap,
    ),
  );
}
