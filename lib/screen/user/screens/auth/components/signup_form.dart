import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true; // State to manage password visibility

  // Email validation function
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // Return null if the input is valid
  }

  // Password validation function
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null; // Return null if the input is valid
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (email) {
              // Save email value
            },
            validator: emailValidator, // Assign the validator function
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email address",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/user/Message.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            onSaved: (pass) {
              // Save password value
            },
            validator: passwordValidator, // Assign the validator function
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/user/Lock.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.3),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';



// class SignUpForm extends StatelessWidget {
//   const SignUpForm({
//     super.key,
//     required this.formKey,
//   });

//   final GlobalKey<FormState> formKey;

//   @override
//   Widget build(BuildContext context) {
//     var emaildValidator;
//     var passwordValidator;
//     return Form(
//       key: formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             onSaved: (email) {
//               // Email
//             },
//             validator: emaildValidator.call,
//             textInputAction: TextInputAction.next,
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//               hintText: "Email address",
//               prefixIcon: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
//                 child: SvgPicture.asset(
//                   "assets/icons/Message.svg",
//                   height: 24,
//                   width: 24,
//                   colorFilter: ColorFilter.mode(
//                     Theme.of(context)
//                         .textTheme
//                         .bodyLarge!
//                         .color!
//                         .withOpacity(0.3),
//                     BlendMode.srcIn,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: defaultPadding),
//           TextFormField(
//             onSaved: (pass) {
//               // Password
//             },
//             validator: passwordValidator.call,
//             obscureText: true,
//             decoration: InputDecoration(
//               hintText: "Password",
//               prefixIcon: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
//                 child: SvgPicture.asset(
//                   "assets/icons/Lock.svg",
//                   height: 24,
//                   width: 24,
//                   colorFilter: ColorFilter.mode(
//                     Theme.of(context)
//                         .textTheme
//                         .bodyLarge!
//                         .color!
//                         .withOpacity(0.3),
//                     BlendMode.srcIn,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }