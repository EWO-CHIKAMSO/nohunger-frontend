// // screens/login_screen.dart - New file
// import 'package:flutter/material.dart';
// import 'package:nohunger/screen/logistic/ui/home_screen.dart';





import 'package:flutter/material.dart';
import 'package:nohunger/entry_point.dart';
import 'package:nohunger/screen/admin/admin_dasboard.dart';
import 'package:nohunger/screen/logistic/ui/home_screen.dart';
import 'package:nohunger/screen/vendor/ui/dashboard.dart';


// Main Login Screen
class UserLogin extends StatefulWidget {
  final VoidCallback onGoToSecondPage;
  const UserLogin({Key? key, required this.onGoToSecondPage}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedRole;

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_isValidCredentials(_usernameController.text, _passwordController.text)) {
        _navigateToRoleScreen();
      } else {
        _showErrorMessage("Invalid username or password");
      }
    }
  }

  bool _isValidCredentials(String username, String password) {
    return username == 'user' && password == 'pass'; // Replace with your logic
  }

  void _navigateToRoleScreen() {
    Widget nextScreen;

    switch (_selectedRole) {
      case 'User':
        nextScreen = EntryPoint();
        break;
      case 'Rider':
      
        nextScreen = HomeScreen(onGoBack: () {  },);
        break;
      case 'Vendor':
        nextScreen = EcommerceDashboard(onGoToSecondPage: () {  },);
        break;
      case 'Admin':
        nextScreen = AdminDashboard(onGoToSecondPage: () {  },);
        break;
      default:
        _showErrorMessage("Please select a valid role");
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => nextScreen),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(),
                  const SizedBox(height: 40),
                  _buildLoginHeader(),
                  const SizedBox(height: 24),
                   _buildRoleDropdown(),
                      const SizedBox(height: 24),
                  _buildUsernameField(),
                  const SizedBox(height: 16),
                  _buildPasswordField(),
                  const SizedBox(height: 16),
                 
                  const SizedBox(height: 24),
                  _buildLoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.pink[600],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.shopping_bag, color: Colors.white, size: 32),
        ),
        const SizedBox(width: 12),
        const Text(
          'Ready\neCommerce',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );
  }

  Widget _buildLoginHeader() {
    return const Text(
      'Login to your account',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: const Icon(Icons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget _buildRoleDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedRole,
      decoration: InputDecoration(
        labelText: "Select Role",
        prefixIcon: const Icon(Icons.person_outline),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: const [
        DropdownMenuItem(value: "User", child: Text("User")),
        DropdownMenuItem(value: "Rider", child: Text("Rider")),
        DropdownMenuItem(value: "Vendor", child: Text("Vendor")),
        DropdownMenuItem(value: "Admin", child: Text("Admin")),
      ],
      onChanged: (value) {
        setState(() {
          _selectedRole = value;
        });
      },
      validator: (value) => value == null ? "Please select a role" : null,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink[600],
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}


// class UserLogin extends StatefulWidget {
//   final VoidCallback onGoToSecondPage;
//   const UserLogin({Key? key,  required  this.onGoToSecondPage}) : super(key: key);

//   @override
//   State<UserLogin> createState() => _UserLoginState();
// }

// class _UserLoginState extends State<UserLogin> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       final username = _usernameController.text;
//       final password = _passwordController.text;

//       if (_isValidCredentials(username, password)) {
//         _navigateToHome();
//       } else {
//         _showErrorMessage('Invalid username or password');
//       }
//     }
//   }

//   bool _isValidCredentials(String username, String password) {
//     return username == 'user' && password == 'pass';
//   }

//  void _navigateToHome() {
//   Navigator.pushReplacement(
//   context,
//   MaterialPageRoute(
//     builder: (context) => HomeScreen(onGoBack: widget.onGoToSecondPage),
//   ),
// );

// }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 _buildLogo(),
//                 const SizedBox(height: 48),
//                 _buildLoginHeader(),
//                 const SizedBox(height: 24),
//                 _buildUsernameField(),
//                 const SizedBox(height: 16),
//                 _buildPasswordField(),
//                 const SizedBox(height: 24),
//                 _buildLoginButton(),
//                 const SizedBox(height: 16),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLogo() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.pink[600],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: const Icon(Icons.shopping_bag, color: Colors.white, size: 32),
//         ),
//         const SizedBox(width: 12),
//         const Text(
//           'Ready\neCommerce',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLoginHeader() {
//     return const Text(
//       'Login to your account',
//       style: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//       ),
//       textAlign: TextAlign.center,
//     );
//   }

//   Widget _buildUsernameField() {
//     return TextFormField(
//       controller: _usernameController,
//       decoration: InputDecoration(
//          labelText: 'Username',
//         prefixIcon: const Icon(Icons.person),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your username';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildPasswordField() {
//     return TextFormField(
//       controller: _passwordController,
//       obscureText: true,
//       decoration: InputDecoration(
//         labelText: 'Password',
//         prefixIcon: const Icon(Icons.lock),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your password';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildLoginButton() {
//     return ElevatedButton(
//       onPressed: _login,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.pink[600],
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       child: const Text(
//         'Login',
//         style: TextStyle(
//           fontSize: 16,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

