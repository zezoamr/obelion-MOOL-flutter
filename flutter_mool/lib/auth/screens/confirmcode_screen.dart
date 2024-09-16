import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class ConfirmCodeScreen extends StatelessWidget {
  const ConfirmCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 46, 51),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        title: const Text(
          'Verification',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            const Expanded(
              flex: 8,
              child: ConfirmCodeForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmCodeForm extends StatefulWidget {
  const ConfirmCodeForm({Key? key}) : super(key: key);

  @override
  _ConfirmCodeFormState createState() => _ConfirmCodeFormState();
}

class _ConfirmCodeFormState extends State<ConfirmCodeForm> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  late Timer _timer;
  int _remainingTime = 59;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 237, 237, 237),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/account/verf.png',
            width: 200,
            height: 200,
          ),
          const Text(
            'Enter 4 Digits code sent to',
            style: TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const Text(
            '+961518745363',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildCodeInputField(),
          const SizedBox(height: 20),
          Text(
            'Resend code in 00:${_remainingTime.toString().padLeft(2, '0')}',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 2),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildCodeInputField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (index) => SizedBox(
          width: 50,
          height: 50,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: (value) {
              if (value.length == 1 && index < 3) {
                _focusNodes[index + 1].requestFocus();
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            style: const TextStyle(fontSize: 24),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ),
    );
  }
}
