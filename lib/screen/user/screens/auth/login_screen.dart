import 'dart:async';
import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/screens/auth/components/login_form.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  
  // List of image paths for the slider
  final List<String> loginImages = [
    "assets/images/user/stocks/other/provision.png",
    "assets/images/user/stocks/other/soft_drinks.png", 
    "assets/images/user/stocks/other/carton_milk.png",
  ];

  @override
  void initState() {
    super.initState();
    // Auto-scroll timer
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < loginImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom Carousel implementation
            SizedBox(
              height: size.height * 0.3,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: loginImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            loginImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  // Dots indicator
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: loginImages.asMap().entries.map((entry) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(
                              _currentPage == entry.key ? 0.9 : 0.4,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Log in with your data that you entered during your registration.",
                  ),
                  const SizedBox(height: defaultPadding),
                  LogInForm(formKey: _formKey),
                  Align(
                    child: TextButton(
                      child: const Text("Forgot password"),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, passwordRecoveryScreenRoute);
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height > 700
                        ? size.height * 0.1
                        : defaultPadding,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            entryPointScreenRoute,
                            ModalRoute.withName(logInScreenRoute));
                      }
                    },
                    child: const Text("Log in"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, signUpScreenRoute);
                        },
                        child: const Text("Sign up"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





// import 'package:client/route/route_constants.dart';
// import 'package:client/screen/user/screens/auth/components/login_form.dart';
// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';



// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.asset(
//               "assets/images/user/login_dark.png",
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Welcome back!",
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   const SizedBox(height: defaultPadding / 2),
//                   const Text(
//                     "Log in with your data that you intered during your registration.",
//                   ),
//                   const SizedBox(height: defaultPadding),
//                   LogInForm(formKey: _formKey),
//                   Align(
//                     child: TextButton(
//                       child: const Text("Forgot password"),
//                       onPressed: () {
//                         Navigator.pushNamed(
//                             context, passwordRecoveryScreenRoute);
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height > 700
//                         ? size.height * 0.1
//                         : defaultPadding,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.pushNamedAndRemoveUntil(
//                             context,
//                             entryPointScreenRoute,
//                             ModalRoute.withName(logInScreenRoute));
//                       }
//                     },
//                     child: const Text("Log in"),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Don't have an account?"),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, signUpScreenRoute);
//                         },
//                         child: const Text("Sign up"),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }