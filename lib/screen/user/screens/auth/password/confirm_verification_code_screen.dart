import 'package:flutter/material.dart';
import 'package:nohunger/screen/user/screens/auth/password/set_new_password_screen.dart';

class ConfirmVerificationCodeScreen extends StatelessWidget {
  const ConfirmVerificationCodeScreen({super.key});

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center contents vertically
            children: [
              // First Row: Title and Subtexts
              const Text(
                'Verification code',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'We have sent the code verification to +99****1233.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const Text(
                'Change phone number?',
                style: TextStyle(color: Colors.blue),
              ),
              const SizedBox(height: 20),
              // Second Row: Four Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('')),
                )),
              ),
              const SizedBox(height: 40),
              // Third Row: Two Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      // Resend code logic
                    },
                    child: const Text('Resend'),
                  ),
                  SizedBox(
                    width: 120, // Set a fixed width for the ElevatedButton
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:client/screen/user/screens/auth/password/confirm_verification_code.dart';
// import 'package:flutter/material.dart';

// class VerificationCodeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verification Code'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ConfirmVerificationCodeScreen()),
//             );
//           },
//           child: Text('Next'),
//         ),
//       ),
//     );
//   }
// }