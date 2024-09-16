import 'package:flutter/material.dart';

class AddressForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, String>? initialData;
  final Function(Map<String, String>) onSave;

  const AddressForm({
    Key? key,
    required this.formKey,
    this.initialData,
    required this.onSave,
  }) : super(key: key);

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late final TextEditingController _countryController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _codeController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _streetNameController;
  late final TextEditingController _buildingController;
  late final TextEditingController _cityController;
  late final TextEditingController _landmarkController;

  @override
  void initState() {
    super.initState();
    _countryController =
        TextEditingController(text: widget.initialData?['country'] ?? '');
    _fullNameController =
        TextEditingController(text: widget.initialData?['fullName'] ?? '');
    _codeController =
        TextEditingController(text: widget.initialData?['code'] ?? '');
    _phoneNumberController =
        TextEditingController(text: widget.initialData?['phoneNumber'] ?? '');
    _streetNameController =
        TextEditingController(text: widget.initialData?['streetName'] ?? '');
    _buildingController =
        TextEditingController(text: widget.initialData?['building'] ?? '');
    _cityController =
        TextEditingController(text: widget.initialData?['city'] ?? '');
    _landmarkController =
        TextEditingController(text: widget.initialData?['landmark'] ?? '');
  }

  @override
  void dispose() {
    _countryController.dispose();
    _fullNameController.dispose();
    _codeController.dispose();
    _phoneNumberController.dispose();
    _streetNameController.dispose();
    _buildingController.dispose();
    _cityController.dispose();
    _landmarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      onChanged: () {
        widget.onSave({
          'country': _countryController.text,
          'fullName': _fullNameController.text,
          'code': _codeController.text,
          'phoneNumber': _phoneNumberController.text,
          'streetName': _streetNameController.text,
          'building': _buildingController.text,
          'city': _cityController.text,
          'landmark': _landmarkController.text,
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Enter your shipping address',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildDropdownField('Country', _countryController),
          _buildTextField('Full Name', _fullNameController),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: _buildTextField('Code', _codeController),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 3,
                child: _buildTextField('Phone Number', _phoneNumberController),
              ),
            ],
          ),
          _buildTextField('Street name', _streetNameController),
          _buildTextField('Building name / no', _buildingController),
          _buildTextField('City / Area', _cityController),
          _buildTextField('Nearest landmark', _landmarkController),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: controller.text.isEmpty ? null : controller.text,
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.text = newValue;
          }
        },
        items: <String>['USA', 'Canada', 'UK', 'Australia', 'Egypt']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
