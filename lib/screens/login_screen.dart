import 'package:flutter/material.dart';
import 'package:sabka_bazaar/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);
      Navigator.pushNamed(context, '/home');
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
    final passwordTextField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Password'),
      validator: (value) {
        return validatePassword(value);
      },
      onChanged: (value) => _password = value,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Get access to your Orders, Wishlist and Recommendations.",
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [emailTextField, passwordTextField],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        _trySubmitForm();
                      },
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                           side: const BorderSide(
                              color: Colors.greenAccent,
                            ),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14,   color: Colors.red),
                            
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width),
                color: Colors.grey.shade200,
                child: const Text(
                    'Copyright © 2020-2023 Sabka Bazaar Grocery Supplies Pvt Ltd',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black
                  ),
                ),
              ),
          )
        ],
      ),
    );
  }
}
