import 'package:flutter/material.dart';
import 'package:sabka_bazaar/utils/validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);
    } else {
      debugPrint("Validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailTextField = TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (value) {
        return validateEmail(value);
      },
      onChanged: (value) => _userEmail = value,
    );

    final usernameTextField = TextFormField(
      decoration: const InputDecoration(labelText: 'Username'),
      validator: (value) {
        return validateUsername(value);
      },
      onChanged: (value) => _userName = value,
    );

    final passwordTextField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Password'),
      validator: (value) {
        return validatePassword(value);
      },
      onChanged: (value) => _password = value,
    );
    final confirmPasswordTextField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Password'),
      validator: (value) {
        return validateConfirmPassword(value, _password);
      },
      onChanged: (value) => _confirmPassword = value,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: const [
                Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "We do not share your personal details with any one.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
            Container(
              color: Colors.white,
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      emailTextField,
                      usernameTextField,
                      passwordTextField,
                      confirmPasswordTextField,
                      const SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        _trySubmitForm();
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                              color: Colors.greenAccent,
                            ),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                           color: Colors.white,
                        ),
                      ),
                    ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
