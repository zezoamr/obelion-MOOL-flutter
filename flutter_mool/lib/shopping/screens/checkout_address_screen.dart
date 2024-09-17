import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mool/shopping/cubits/checkout_cubit.dart';
import 'package:flutter_mool/shopping/screens/checkout_payment.dart';
import 'package:flutter_mool/shopping/widgets/progress_bar_widget.dart';
import 'package:flutter_mool/shopping/widgets/shipping_addresses_widget.dart';

class CheckoutAddressScreen extends StatefulWidget {
  @override
  _CheckoutAddressScreenState createState() => _CheckoutAddressScreenState();
}

class _CheckoutAddressScreenState extends State<CheckoutAddressScreen> {
  bool _isAddingAddress = false;
  int? _editingIndex;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> _currentAddress = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 231, 231, 231),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 46, 46, 51),
            title: Text(
              'Checkout',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/account/arrowback.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBarWidget(currentStep: 1),
              Expanded(
                child: _isAddingAddress || _editingIndex != null
                    ? _buildAddressForm(context, state)
                    : _buildAddressList(context, state),
              ),
              CheckoutButton(
                onPressed: () {
                  if (_isAddingAddress || _editingIndex != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (_editingIndex != null) {
                        context
                            .read<CheckoutCubit>()
                            .updateAddress(_editingIndex!, _currentAddress);
                      } else {
                        context
                            .read<CheckoutCubit>()
                            .addAddress(_currentAddress);
                      }
                      setState(() {
                        _isAddingAddress = false;
                        _editingIndex = null;
                      });
                    }
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPaymentScreen()));
                  }
                },
                text: _isAddingAddress || _editingIndex != null
                    ? 'Save Address'
                    : 'Confirm and Continue',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddressList(BuildContext context, CheckoutState state) {
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
            ...state.addresses.asMap().entries.map(
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
                  onPressed: () => setState(() => _editingIndex = index),
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
      onPressed: () => setState(() => _isAddingAddress = true),
      icon: Icon(Icons.add),
      label: Text('Add new address'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.transparent),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }

  Widget _buildAddressForm(BuildContext context, CheckoutState state) {
    final address = _editingIndex != null
        ? state.addresses[_editingIndex!]
        : <String, String>{};

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddressForm(
          formKey: _formKey,
          initialData: address,
          onSave: (newAddress) {
            _currentAddress = newAddress;
          },
        ),
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CheckoutButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
