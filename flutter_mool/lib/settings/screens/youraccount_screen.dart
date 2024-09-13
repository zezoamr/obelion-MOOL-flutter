import 'package:flutter/material.dart';
import 'package:flutter_mool/settings/data/user_data.dart';
import 'package:flutter_mool/settings/widgets/buildtextfield.dart';

class YouraccountScreen extends StatelessWidget {
  const YouraccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Your account',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ChangeInfo(
            userData: UserData(
                name: "Ahmed Saad El Din",
                email: "a.saadeldin1986@gmail.com",
                phone: "01146296466",
                dateOfBirth: "1st , September 1986",
                password: "************"),
          ),
        ],
      ),
    );
  }
}

class ChangeInfo extends StatefulWidget {
  final UserData userData;

  const ChangeInfo({Key? key, required this.userData}) : super(key: key);

  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController dateOfBirthController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userData.name);
    emailController = TextEditingController(text: widget.userData.email);
    phoneController = TextEditingController(text: widget.userData.phone);
    dateOfBirthController =
        TextEditingController(text: widget.userData.dateOfBirth);
    passwordController = TextEditingController(text: widget.userData.password);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    passwordController.dispose();
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
          buildTextField('Name', nameController),
          buildTextField('Email', emailController),
          buildTextField('Phone', phoneController, isVerified: true),
          buildTextField('Date of birth', dateOfBirthController,
              hasCalendarIcon: true),
          buildTextField('Password', passwordController, isPassword: true),
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
            child: Text('Sign Up'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
            child: Text('Delete Account'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
