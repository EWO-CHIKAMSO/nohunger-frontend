import 'package:nohunger/screen/user/screens/auth/password/set_new_password_screen.dart';
import 'package:flutter/material.dart';

class ConfirmVerificationCodeScreen extends StatelessWidget {
  const ConfirmVerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Verification Code'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SetNewPasswordScreen()),
            );
          },
          child: const Text('Confirm'),
        ),
      ),
    );
  }
}