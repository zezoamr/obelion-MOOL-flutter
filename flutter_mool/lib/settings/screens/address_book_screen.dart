import 'package:flutter/material.dart';
import 'package:flutter_mool/shopping/widgets/shipping_addresses_widget.dart';

class AddressBookScreen extends StatefulWidget {
  @override
  _AddressBookScreenState createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  bool _isAddingAddress = false;
  int? _editingIndex;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> _currentAddress = {};

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
          'Address Book',
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
          Expanded(
            child: addresses.isEmpty && !_isAddingAddress
                ? NoAddressWidget(onAddAddress: _startAddingAddress)
                : _isAddingAddress || _editingIndex != null
                    ? _buildAddressForm()
                    : _buildAddressList(),
          ),
          if (_isAddingAddress ||
              _editingIndex != null) //addresses.isNotEmpty ||
            CheckoutButton(
              onPressed: _handleCheckoutButtonPress,
              text: _isAddingAddress || _editingIndex != null
                  ? 'Save Address'
                  : 'Confirm and Continue',
            ),
        ],
      ),
    );
  }

  void _startAddingAddress() {
    setState(() {
      _isAddingAddress = true;
    });
  }

  Widget _buildAddressList() {
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
            ...addresses
                .asMap()
                .entries
                .map((entry) => _buildAddressCard(entry.key, entry.value)),
            const SizedBox(height: 16),
            _buildAddNewAddressButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard(int index, Map<String, String> address) {
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

  Widget _buildAddNewAddressButton() {
    return OutlinedButton.icon(
      onPressed: _startAddingAddress,
      icon: Icon(Icons.add),
      label: Text('Add new address'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.grey),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }

  Widget _buildAddressForm() {
    final address =
        _editingIndex != null ? addresses[_editingIndex!] : <String, String>{};

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

  void _handleCheckoutButtonPress() {
    if (_isAddingAddress || _editingIndex != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        setState(() {
          if (_editingIndex != null) {
            addresses[_editingIndex!] = _currentAddress;
          } else {
            addresses.add(_currentAddress);
          }
          _isAddingAddress = false;
          _editingIndex = null;
        });
      }
    } else {}
  }
}

class NoAddressWidget extends StatelessWidget {
  final VoidCallback onAddAddress;

  const NoAddressWidget({Key? key, required this.onAddAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.purple.shade100, Colors.blue.shade100],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Icon(Icons.home, size: 48, color: Colors.purple.shade200),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.location_on,
                        color: Colors.white, size: 24),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'No Address Yet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please add your address for your better experience',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onAddAddress,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('Add Address'),
            ),
          ],
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
