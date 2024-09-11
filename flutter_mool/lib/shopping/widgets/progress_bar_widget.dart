import 'package:flutter/material.dart';

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
