import 'package:nohunger/screen/user/screens/auth/components/signup_form.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../route/screen_export.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  // List of image paths for the slider - you can adjust these paths based on your assets
  final List<String> signupImages = [
    "assets/images/user/signUp_dark.png",
    "assets/images/stores/chicken_cottage.jpg",
    "assets/images/stores/amala360_2.jpeg",
  ];

  @override
  void initState() {
    super.initState();
    // Auto-scroll timer
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < signupImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom Carousel implementation with curved bottom corners
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.black, // Background color for the container
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: signupImages.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      signupImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's get started!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Please enter your valid data in order to create an account.",
                  ),
                  const SizedBox(height: defaultPadding),
                  SignUpForm(formKey: _formKey),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                        value: _isChecked,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "I agree with the",
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, termsOfServicesScreenRoute);
                                  },
                                text: " Terms of service ",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: "& privacy policy.",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, entryPointScreenRoute);
                    },
                    child: const Text("Continue"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Do you have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, logInScreenRoute);
                        },
                        child: const Text("Log in"),
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


// import 'package:client/screen/user/screens/auth/components/signup_form.dart';
// import 'package:client/utilities/constants.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import '../../../../route/screen_export.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isChecked = false;
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//   Timer? _timer;

//   // List of image paths for the slider - you can adjust these paths based on your assets
//   final List<String> signupImages = [
//     "assets/images/user/signUp_dark.png",
//     "assets/images/stores/chicken_cottage.jpg",
//     "assets/images/stores/amala360_2.jpeg",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // Auto-scroll timer
//     _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
//       if (_currentPage < signupImages.length - 1) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
//       if (_pageController.hasClients) {
//         _pageController.animateToPage(
//           _currentPage,
//           duration: const Duration(milliseconds: 350),
//           curve: Curves.easeIn,
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Custom Carousel implementation
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.35,
//               child: Stack(
//                 children: [
//                   PageView.builder(
//                     controller: _pageController,
//                     onPageChanged: (int page) {
//                       setState(() {
//                         _currentPage = page;
//                       });
//                     },
//                     itemCount: signupImages.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.black, // Dark background for images
//                         ),
//                         child: Image.asset(
//                           signupImages[index],
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         ),
//                       );
//                     },
//                   ),
//                   // Dots indicator
//                   Positioned(
//                     bottom: 20,
//                     left: 0,
//                     right: 0,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: signupImages.asMap().entries.map((entry) {
//                         return Container(
//                           width: 8.0,
//                           height: 8.0,
//                           margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.white.withOpacity(
//                               _currentPage == entry.key ? 0.9 : 0.4,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Let's get started!",
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   const SizedBox(height: defaultPadding / 2),
//                   const Text(
//                     "Please enter your valid data in order to create an account.",
//                   ),
//                   const SizedBox(height: defaultPadding),
//                   SignUpForm(formKey: _formKey),
//                   const SizedBox(height: defaultPadding),
//                   Row(
//                     children: [
//                       Checkbox(
//                         onChanged: (value) {
//                           setState(() {
//                             _isChecked = value ?? false;
//                           });
//                         },
//                         value: _isChecked,
//                       ),
//                       Expanded(
//                         child: Text.rich(
//                           TextSpan(
//                             text: "I agree with the",
//                             children: [
//                               TextSpan(
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     Navigator.pushNamed(
//                                         context, termsOfServicesScreenRoute);
//                                   },
//                                 text: " Terms of service ",
//                                 style: const TextStyle(
//                                   color: primaryColor,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const TextSpan(
//                                 text: "& privacy policy.",
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: defaultPadding * 2),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, entryPointScreenRoute);
//                     },
//                     child: const Text("Continue"),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Do you have an account?"),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, logInScreenRoute);
//                         },
//                         child: const Text("Log in"),
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