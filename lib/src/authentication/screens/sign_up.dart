import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/src/authentication/network/auth_firebase.dart';
import 'package:flutter_auth_app/src/utils/function_utils.dart';
import 'package:flutter_auth_app/src/utils/screens/loading.dart';

class SignUp extends StatefulWidget {
  final VoidCallback toggle;
  SignUp({Key? key, required this.toggle}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    User? user = await AuthFirebase.createUser(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    if (user == null) {
      showAuthErrorDialog(context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Loading()
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: Color(0xff001d3d),
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 20.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.icecream_rounded,
                            size: 80.0,
                            color: Colors.white70,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Create account ',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30.0,
                                ),
                              ),
                              Text(
                                '.',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.blue.shade200,
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Register below with your details!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 2.5,
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an email';
                              } else if (!(value.contains('@') &&
                                  value.contains('.com'))) {
                                return 'Please enter a valid email';
                              } else {
                                print('email validated - is Not empty');
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            controller: _emailController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(color: Colors.redAccent.shade200),
                              contentPadding: const EdgeInsets.all(8.0),
                              hintText: 'Enter email',
                              hintStyle: const TextStyle(fontSize: 14.0),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Colors.redAccent.shade100,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a password';
                              } else if (value.length < 6) {
                                return 'Password enter a strong password';
                              } else {
                                print('password validated - is Not empty');
                              }
                              return null;
                            },
                            controller: _passwordController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(color: Colors.redAccent.shade200),
                              contentPadding: const EdgeInsets.all(8.0),
                              hintText: 'Enter password',
                              hintStyle: const TextStyle(fontSize: 14.0),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Colors.redAccent.shade100,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                signUpUser();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.blue.shade200,
                              ),
                              child: const Center(
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  widget.toggle();
                                },
                                child: const Text(
                                  'Login!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
