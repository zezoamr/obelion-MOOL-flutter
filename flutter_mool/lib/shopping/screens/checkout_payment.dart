import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mool/shopping/cubits/checkout_cubit.dart';
import 'package:flutter_mool/shopping/data/payment_method.dart';
import 'package:flutter_mool/shopping/screens/checkout_review_screen.dart';
import 'package:flutter_mool/shopping/widgets/progress_bar_widget.dart';

class CheckoutPaymentScreen extends StatefulWidget {
  @override
  _CheckoutPaymentScreenState createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  List<PaymentMethod> paymentMethods = [];
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  Map<String, String> paymentDetails = {};

  @override
  void initState() {
    super.initState();
    paymentMethods = [
      PaymentMethod(
        name: 'Cash on Delivery',
        icon: const Icon(Icons.money),
      ),
      PaymentMethod(
        name: 'Credit Card',
        icon: Icon(Icons.credit_card),
        additionalFields: buildCreditCardFields(),
      ),
      PaymentMethod(
        name: 'Paymob',
        icon: Icon(Icons.credit_card),
      ),
    ];

    _nameOnCardController.addListener(_updatePaymentDetails);
    _cardNumberController.addListener(_updatePaymentDetails);
    _expiryDateController.addListener(_updatePaymentDetails);
    _cvvController.addListener(_updatePaymentDetails);
  }

  @override
  void dispose() {
    _nameOnCardController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _updatePaymentDetails() {
    setState(() {
      paymentDetails = {
        'nameOnCard': _nameOnCardController.text,
        'cardNumber': _cardNumberController.text.replaceAll(' ', ''),
        'expiryDate': _expiryDateController.text,
        'cvv': _cvvController.text,
      };
    });
    //print(paymentDetails);
  }

  Widget buildCreditCardFields() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Name on card', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          TextFormField(
            controller: _nameOnCardController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the name on the card';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          const Text('Card Number', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          TextFormField(
            controller: _cardNumberController,
            decoration: InputDecoration(
              hintText: '**** **** **** ****',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the card number';
              }
              if (value.replaceAll(' ', '').length != 16) {
                return 'Card number must be 16 digits';
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Expiration date',
                        style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 4),
                    TextFormField(
                      controller: _expiryDateController,
                      decoration: InputDecoration(
                        hintText: 'MM/YY',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the expiry date';
                        }
                        if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
                          return 'Use format MM/YY';
                        }
                        return null;
                      },
                      enableInteractiveSelection: false, //disallow paste
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Security code', style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 4),
                    TextFormField(
                      controller: _cvvController,
                      decoration: InputDecoration(
                        hintText: 'CVV',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the CVV';
                        }
                        if (value.length != 3) {
                          return 'CVV must be 3 digits';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Checkout',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProgressBarWidget(currentStep: 2),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PaymentOptionsWidget(
                paymentMethods: paymentMethods,
                onPaymentMethodSelected: (method) {
                  print('Selected payment method: ${method.name}');
                },
              ),
            ),
            CheckoutButton(
              paymentDetails: paymentDetails,
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  final Map<String, String> paymentDetails;
  final GlobalKey<FormState> formKey;

  const CheckoutButton({
    Key? key,
    required this.paymentDetails,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState != null &&
              formKey.currentState!.validate()) {
            BlocProvider.of<CheckoutCubit>(context)
                .setPaymentDetails(paymentDetails);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutReviewScreen()),
            );
          } else {
            // Show a snackbar or some other feedback if the form is not valid
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Please fill in all required fields')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text('Confirm and Continue'),
      ),
    );
  }
}

class PaymentOptionsWidget extends StatefulWidget {
  final List<PaymentMethod> paymentMethods;
  final Function(PaymentMethod) onPaymentMethodSelected;

  const PaymentOptionsWidget({
    Key? key,
    required this.paymentMethods,
    required this.onPaymentMethodSelected,
  }) : super(key: key);

  @override
  _PaymentOptionsWidgetState createState() => _PaymentOptionsWidgetState();
}

class _PaymentOptionsWidgetState extends State<PaymentOptionsWidget> {
  PaymentMethod? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Payment Method',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...widget.paymentMethods
            .map((method) => _buildPaymentMethodTile(method)),
        const SizedBox(height: 16),
        _buildGiftCardSection(),
      ],
    );
  }

  Widget _buildPaymentMethodTile(PaymentMethod method) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: RadioListTile<PaymentMethod>(
            title: Text(method.name),
            value: method,
            groupValue: _selectedMethod,
            onChanged: (PaymentMethod? value) {
              setState(() {
                _selectedMethod = value;
              });
              if (value != null) {
                widget.onPaymentMethodSelected(value);
              }
            },
            secondary: SizedBox(
              width: 48,
              child: method.icon,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
        if (_selectedMethod == method && method.additionalFields != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: method.additionalFields!,
          ),
      ],
    );
  }

  Widget _buildGiftCardSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gift Cards and Promotional Codes',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Code',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Apply',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.blue),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
