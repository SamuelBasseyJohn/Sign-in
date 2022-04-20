import 'package:flutter/material.dart';
import 'package:my_flutter_assignment/home_main.dart';

import 'widgets/app_text.dart';
import 'main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool? checkboxValue = false;
  bool _isVisible = false;
  String? myName;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(Icons.message),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      //color of the background
      backgroundColor: Colors.grey[200],
      // SafeArea to avoid bezels
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SafeArea(
                // This container is for holding all the items
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  // I used this to add a border radius to the Container
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Row for the title 'Create your account'
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25.0),
                                child: AppText(
                                  text: "Sign-in",
                                  textColor: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        // Set line below this widget to divide the Title from input
                        const Divider(
                          color: Colors.black,
                        ),
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: AppText(text: "Email address")),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            20.0,
                            15.0,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              String pattern = r'\w+@\w+.\w+';
                              RegExp regex = RegExp(pattern);
                              if (value == null || value.isEmpty) {
                                return "Enter your Email address";
                              } else if (!regex.hasMatch(value)) {
                                return "Enter a valid Email";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: _email,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              hintText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: AppText(text: "Password")),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            20.0,
                            15.0,
                          ),
                          child: TextFormField(
                            autocorrect: false,
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return "Enter password";
                              } else if (value.length < 8) {
                                return "Password must not contain less than 8 digits";
                              } else {
                                return null;
                              }
                            }),
                            obscureText: !_isVisible,
                            controller: _password,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: _isVisible
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                              ),
                              hintText: "Password",
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 10,
                        ),

                        //Tenary operator for Checking if the required textFormFields are
                        // filled and valid to enable color
                        (_email.text.length >= 1 && _password.text.length >= 1)
                            ? AppButton(
                                buttonColor: Colors.blue,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    name();
                                    // buttonColor();
                                  }
                                },
                              )
                            : AppButton(
                                buttonColor: Colors.grey,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    name();
                                    // buttonColor();
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account yet?"),
                  TextButton(
                    child: const Text("Sign Up",
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                      print("Account Has been Created");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void name() async {
    final input = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const HomeMain()));
  }
}
