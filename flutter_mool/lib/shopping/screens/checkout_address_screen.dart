import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mool/shopping/cubits/checkout_cubit.dart';
import 'package:flutter_mool/shopping/screens/checkout_payment.dart';
import 'package:flutter_mool/shopping/widgets/progress_bar_widget.dart';

class CheckoutAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 46, 46, 51),
            title: Text(
              'Cart',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Handle back button press
              },
              child: Image.asset(
                'assets/images/account/arrowback.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
          body: Column(
            children: [
              ProgressBarWidget(currentStep: 1),
              Expanded(
                child: ShippingAddressesWidget(
                  addresses: state.addresses,
                  onEditAddress: (index, newAddress) {
                    context
                        .read<CheckoutCubit>()
                        .updateAddress(index, newAddress);
                  },
                  onAddNewAddress: (newAddress) {
                    context.read<CheckoutCubit>().addAddress(newAddress);
                  },
                ),
              ),
              CheckoutButton(),
            ],
          ),
        );
      },
    );
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
