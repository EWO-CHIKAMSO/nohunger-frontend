import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  final Widget nextScreen;

  const SplashScreen({
    super.key,
    required this.nextScreen,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _bounceAnimation;
  late Animation<double> _expandAnimation;
  late Animation<double> _ballFadeAnimation;
  late Animation<double> _logoFadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500), // Total animation duration
      vsync: this,
    );

    // Slide animation (ball slides up from the bottom)
    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    // Bouncing ball animation
    _bounceAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.elasticOut), // Bounce effect
      ),
    );

    // Expand animation to fill the screen
    _expandAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeInOut),
      ),
    );

    // Ball fade-out animation
    _ballFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 0.8, curve: Curves.easeOut),
      ),
    );

    // Logo fade-in animation with delay
    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          PageTransition(
            type: PageTransitionType.fade,
            child: widget.nextScreen,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Initial background color
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Background color expansion
              Container(
                color: Color.lerp(
                  Colors.white,
                  const Color.fromRGBO(82, 3, 213, 1), // #5203d5
                  _expandAnimation.value,
                ),
              ),

              // Bouncing ball with shadow and fade-out
              if (_ballFadeAnimation.value > 0.0)
                Opacity(
                  opacity: _ballFadeAnimation.value,
                  child: Transform.translate(
                    offset: Offset(
                      0,
                      screenHeight * _slideAnimation.value - 100 * _bounceAnimation.value,
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(82, 3, 213, 1), // #5203d5
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              // Logo fade-in with delay
              if (_logoFadeAnimation.value > 0.0)
                Opacity(
                  opacity: _logoFadeAnimation.value,
                  child: Image.asset(
                    'assets/logo/new/logo-nohunger-purple.png',
                    width: 150,
                    height: 150,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}


// // import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

// class SplashScreen extends StatelessWidget {
//   final Widget nextScreen;

//   const SplashScreen({
//     super.key,
//     required this.nextScreen,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       duration: 2000,
//       splash: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Logo with scaling animation
//           TweenAnimationBuilder(
//             duration: const Duration(milliseconds: 1500),
//             tween: Tween<double>(begin: 0.5, end: 1.0),
//             curve: Curves.easeInOut,
//             builder: (context, double value, child) {
//               return Transform.scale(
//                 scale: value,
//                 child: child,
//               );
//             },
//             child: Image.asset(
//               'assets/logo/new/logo-nohunger-purple.png',
//               width: 150,
//               height: 150,
//             ),
//           ),
//           // Optional: Add a circular progress indicator
//           Positioned(
//             bottom: 50,
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(
//                 Color.fromRGBO(82, 3, 213, 1),
//               ),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: const Color.fromRGBO(82, 3, 213, 1),
//       splashIconSize: 250,
//       nextScreen: nextScreen,
//       splashTransition: SplashTransition.fadeTransition,
//       pageTransitionType: PageTransitionType.fade,
//     );
//   }
// }