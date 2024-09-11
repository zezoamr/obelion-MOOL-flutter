import 'package:flutter/material.dart';
import 'package:flutter_mool/shopping/screens/checkout_payment.dart';

class CheckoutAddressScreen extends StatefulWidget {
  @override
  _CheckoutAddressScreenState createState() => _CheckoutAddressScreenState();
}

class _CheckoutAddressScreenState extends State<CheckoutAddressScreen> {
  List<Map<String, String>> addresses = [
    // {
    //   'country': 'Egypt',
    //   'fullName': 'Ahmed Saad El din',
    //   'code': '+20',
    //   'phoneNumber': '1234567890',
    //   'streetName': 'Abbas el aqad st.',
    //   'building': '45',
    //   'city': 'Cairo',
    //   'landmark': 'Near Central Park',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ProgressBarWidget(currentStep: 1),
          Expanded(
            child: ShippingAddressesWidget(
              addresses: addresses,
              onEditAddress: _handleEditAddress,
              onAddNewAddress: _handleAddNewAddress,
            ),
          ),
          CheckoutButton(),
        ],
      ),
    );
  }

  void _handleEditAddress(int index, Map<String, String> newAddress) {
    setState(() {
      addresses[index] = newAddress;
    });
  }

  void _handleAddNewAddress(Map<String, String> newAddress) {
    setState(() {
      addresses.add(newAddress);
    });
  }
}

class ShippingAddressesWidget extends StatelessWidget {
  final List<Map<String, String>> addresses;
  final Function(int, Map<String, String>) onEditAddress;
  final Function(Map<String, String>) onAddNewAddress;

  const ShippingAddressesWidget({
    Key? key,
    required this.addresses,
    required this.onEditAddress,
    required this.onAddNewAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your shipping address',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...addresses.asMap().entries.map(
                (entry) => _buildAddressCard(context, entry.key, entry.value)),
            const SizedBox(height: 16),
            _buildAddNewAddressButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard(
      BuildContext context, int index, Map<String, String> address) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping address',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () =>
                      _showAddressFormModal(context, index, address),
                  child: Text('Edit', style: TextStyle(color: Colors.teal)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildAddressLine('Name', address['fullName'] ?? ''),
            _buildAddressLine('Street', address['streetName'] ?? ''),
            _buildAddressLine('Building', address['building'] ?? ''),
            _buildAddressLine('City', address['city'] ?? ''),
            _buildAddressLine('Phone',
                '${address['code'] ?? ''} ${address['phoneNumber'] ?? ''}'),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressLine(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: TextStyle(color: Colors.grey[600])),
          ),
          Expanded(
            child: Text(value, style: TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewAddressButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _showAddressFormModal(context, null, null),
      icon: Icon(Icons.add),
      label: Text('Add new address'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.grey),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }

  void _showAddressFormModal(
      BuildContext context, int? index, Map<String, String>? address) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return AddressFormModal(
          initialData: address,
          onSave: (Map<String, String> newAddress) {
            if (index != null) {
              onEditAddress(index, newAddress);
            } else {
              onAddNewAddress(newAddress);
            }
          },
        );
      },
    );
  }
}

class AddressFormModal extends StatefulWidget {
  final Map<String, String>? initialData;
  final Function(Map<String, String>) onSave;

  const AddressFormModal({Key? key, this.initialData, required this.onSave})
      : super(key: key);

  @override
  _AddressFormModalState createState() => _AddressFormModalState();
}

class _AddressFormModalState extends State<AddressFormModal> {
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
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                  child:
                      _buildTextField('Phone Number', _phoneNumberController),
                ),
              ],
            ),
            _buildTextField('Street name', _streetNameController),
            _buildTextField('Building name / no', _buildingController),
            _buildTextField('City / Area', _cityController),
            _buildTextField('Nearest landmark', _landmarkController),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveAddress,
              child: Text('Save Address'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
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

  void _saveAddress() {
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
    Navigator.of(context).pop();
  }
}

class ProgressBarWidget extends StatelessWidget {
  final int currentStep;

  const ProgressBarWidget({Key? key, required this.currentStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final steps = [
      {'label': 'Shipping', 'step': 1},
      {'label': 'Payment', 'step': 2},
      {'label': 'Review', 'step': 3},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: steps.asMap().entries.map((entry) {
          final index = entry.key;
          final step = entry.value;
          final isCompleted = step['step'] as int < currentStep;
          final isCurrent = step['step'] as int == currentStep;
          final isNext = step['step'] as int > currentStep;

          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCurrent
                              ? Colors.grey[800]
                              : isCompleted
                                  ? Colors.teal
                                  : Colors.grey,
                        ),
                        child: isCompleted
                            ? const Icon(Icons.check,
                                color: Colors.white, size: 20)
                            : Center(
                                child: Text(
                                  '${step['step']}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        step['label'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          color: isCurrent
                              ? Colors.grey[800]
                              : isCompleted
                                  ? Colors.teal
                                  : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CheckoutPaymentScreen()));
        },
        child: Text('Confirm and Continue'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
