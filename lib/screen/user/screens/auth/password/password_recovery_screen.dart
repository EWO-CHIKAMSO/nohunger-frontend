import 'package:flutter/material.dart';
import 'package:nohunger/screen/user/screens/auth/password/choose_verification_method_screen.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Password recovery',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter your E-mail address to recover your password',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChooseVerificationMethodScreen()),
                  );
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:client/screen/user/components/buy_full_ui_kit.dart';
// import 'package:flutter/material.dart';



// class PasswordRecoveryScreen extends StatelessWidget {
//   const PasswordRecoveryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const BuyFullKit(images: [
//       "assets/screenshots/Forgot_password.png",
//       "assets/screenshots/Forgot password 6.png",
//       "assets/screenshots/Enter verification code.png",
//       "assets/screenshots/Verificaition code.png",
//       "assets/screenshots/Reset password.png",
//     ]);
//   }
// }