import 'package:flutter/material.dart';

class CheckoutReviewScreen extends StatelessWidget {
  final List<Map<String, String>> paymentCards = [
    {'label': 'Card', 'value': '**** 21587', 'expiry': '09/25'},
    {'label': 'Card', 'value': '**** 12345', 'expiry': '12/26'},
  ];

  final List<Map<String, String>> shippingAddresses = [
    {
      'label': 'Name',
      'value': 'Ahmed Saad El din',
      'street': 'Abbas el aqad st.',
      'building': '45',
      'city': 'Cairo'
    },
    {
      'label': 'Name',
      'value': 'Mohamed Ali',
      'street': 'Tahrir Square',
      'building': '12',
      'city': 'Giza'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Checkout',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          ProgressBarWidget(currentStep: 3),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please confirm your order',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 16),
                    ...paymentCards
                        .map((card) => _buildInfoCard('Payment', card))
                        .toList(),
                    SizedBox(height: 16),
                    ...shippingAddresses
                        .map((address) =>
                            _buildInfoCard('Shipping address', address))
                        .toList(),
                    SizedBox(height: 16),
                    _buildOrderSummary(),
                  ],
                ),
              ),
            ),
          ),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, Map<String, String> details) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Edit', style: TextStyle(color: Colors.teal)),
                ),
              ],
            ),
            SizedBox(height: 8),
            ...details.entries.map((entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(entry.key,
                            style: TextStyle(color: Colors.grey[600])),
                      ),
                      Expanded(
                        child: Text(entry.value,
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 16),
            _buildSummaryRow('Subtotal', '2500 AED'),
            _buildSummaryRow('Shipping Fee', '50 AED'),
            _buildSummaryRow('Total', '2550 AED', isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Submit Order'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
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
