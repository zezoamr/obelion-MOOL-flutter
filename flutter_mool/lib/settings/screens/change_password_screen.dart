import 'package:flutter/material.dart';
import 'package:flutter_mool/settings/data/user_data.dart';
import 'package:flutter_mool/settings/widgets/buildtextfield.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Change Password',
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
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ChangeInfo(),
        ],
      ),
    );
  }
}

class ChangeInfo extends StatefulWidget {
  const ChangeInfo({Key? key}) : super(key: key);

  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  late TextEditingController OldpasswordController;
  late TextEditingController NewpasswordController;
  late TextEditingController ConfirmpasswordController;

  @override
  void initState() {
    super.initState();

    OldpasswordController = TextEditingController(text: '');
    NewpasswordController = TextEditingController(text: '');
    ConfirmpasswordController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    OldpasswordController.dispose();
    NewpasswordController.dispose();
    ConfirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTextField('Old Password', OldpasswordController,
              isEditable: true),
          buildTextField('New Password', NewpasswordController,
              isPassword: true),
          buildTextField('Confirm Password', ConfirmpasswordController,
              isPassword: true),
          SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const ConfirmCodeScreen()),
              // );
            },
            child: Text('Change Password'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
