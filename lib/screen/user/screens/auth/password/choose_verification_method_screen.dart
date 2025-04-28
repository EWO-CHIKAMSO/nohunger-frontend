import 'package:flutter/material.dart';
import 'package:nohunger/screen/user/screens/auth/password/confirm_verification_code_screen.dart';

class ChooseVerificationMethodScreen extends StatelessWidget {
  const ChooseVerificationMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First Row: Illustration Image
            Image.asset('assets/illustrations/Password.png'), // Replace with your image path
            const SizedBox(height: 20),
            // Second Row: Text Contents
            const Text(
              "Choose verification method",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "We'll send you a verification code to reset your password",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Third Row: Two Vertically Arranged Boxes
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 10),
                      Text('+99****1233'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 10),
                      Text('Sepl********@gmail.com'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Next Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConfirmVerificationCodeScreen()),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}