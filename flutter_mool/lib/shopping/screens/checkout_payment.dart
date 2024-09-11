import 'package:flutter/material.dart';
import 'package:flutter_mool/shopping/screens/checkout_review_screen.dart';

class CheckoutPaymentScreen extends StatelessWidget {
  List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      name: 'Cash on Delivery',
      icon: const Icon(Icons.money),
    ),
    PaymentMethod(
      name: 'Credit Card',
      icon: Icon(Icons.credit_card),
      // Image.asset('assets/visa_logo.png', width: 30, height: 20),
      // const SizedBox(width: 4),
      // Image.asset('assets/mastercard_logo.png', width: 30, height: 20),

      // Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //
      //     // Image.asset('assets/visa_logo.png', width: 30, height: 20),
      //     // const SizedBox(width: 4),
      //     // Image.asset('assets/mastercard_logo.png', width: 30, height: 20),
      //   ],
      // ),
      additionalFields: buildCreditCardFields(),
    ),
    PaymentMethod(
      name: 'Paymob',
      icon: Icon(Icons.credit_card),
      // icon: Image.asset('assets/paymob_logo.png', width: 60, height: 20),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Payment',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
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
            CheckoutButton(),
          ],
        ),
      ),
    );
  }
}

Widget buildCreditCardFields() {
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          labelText: 'Name on card',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      const SizedBox(height: 8),
      TextField(
        decoration: InputDecoration(
          labelText: 'Card Number',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Expiration date',
                hintText: 'MM/YY',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Security code',
                hintText: 'CVV',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    ],
  );
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

class PaymentMethod {
  final String name;
  final Widget icon;
  final Widget? additionalFields;

  PaymentMethod(
      {required this.name, required this.icon, this.additionalFields});
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
