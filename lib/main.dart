import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_assignment/Widgets/formFields.dart';
import 'package:my_flutter_assignment/Widgets/appText.dart';
import 'package:my_flutter_assignment/home.dart';
import 'package:my_flutter_assignment/profile.dart';
import 'package:my_flutter_assignment/settings.dart';
import 'Widgets/PhoneNumber.dart';
import 'Widgets/BottomText.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: "Inter-Bold",
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const CreateYourAccount(),
        '/Profile': (BuildContext context) => const ProfilePage(),
        '/Home': (BuildContext context) => const HomePage(),
        '/Settings': (BuildContext context) => const SettingsPage(),
      },
    );
  }
}

class CreateYourAccount extends StatefulWidget {
  const CreateYourAccount({Key? key, title}) : super(key: key);

  @override
  State<CreateYourAccount> createState() => _CreateYourAccountState();
}

class _CreateYourAccountState extends State<CreateYourAccount> {
  // TextEditingController to handle input
  final TextEditingController _firstAndMiddleName = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool? checkboxValue = false;
  bool _isVisible = false;
  String? myName;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Scaffold
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 10,
        backgroundColor: Colors.white54,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
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
                  margin: const EdgeInsets.fromLTRB(16, 40, 16, 20),
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
                                  text: "Create your account",
                                  textColor: Colors.black,
                                  fontSize: 30,
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
                                padding: EdgeInsets.fromLTRB(
                                  20.0,
                                  20.0,
                                  20.0,
                                  5.0,
                                ),
                                child: AppText(
                                  text: "Full legal first and middle name(s) ",
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            20.0,
                            15.0,
                          ),
                          child: FormFields(
                            firstAndMiddleName: _firstAndMiddleName,
                            hintText: 'Full legal first and middle name(s)',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your name";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: AppText(text: "Full legal surname")),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                              20.0,
                              5.0,
                              20.0,
                              15.0,
                            ),
                            child: FormFields(
                              firstAndMiddleName: _surname,
                              hintText: "Full legal surname",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your Surname";
                                } else if (value.length < 3) {
                                  return "Surname?, Less than 3 letters?, IMPOSSIBLE!";
                                } else {
                                  return null;
                                }
                              },
                            )),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            20.0,
                            15.0,
                          ),
                          child: PhoneNumber(phoneNumber: _phoneNumber),
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
                              if (value == null || value.isEmpty) {
                                return "Enter your Email address";
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            25.0,
                            15.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Checkbox(
                                  value: checkboxValue,
                                  onChanged: (value) {
                                    setState(() {
                                      checkboxValue = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  "i confirm the information provided is correct as they appear on my legal document",
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Tenary operator for Checking if the required textFormFields are
                        // filled and valid to enable color
                        (checkboxValue! &&
                                _surname.text.isNotEmpty &&
                                _phoneNumber.text.isNotEmpty &&
                                _email.text.isNotEmpty &&
                                _password.text.isNotEmpty &&
                                _firstAndMiddleName.text.isNotEmpty)
                            ? AppButton(
                                buttonColor: Colors.blue,
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      checkboxValue!) {
                                    name();
                                    // buttonColor();
                                  }
                                },
                              )
                            : AppButton(
                                buttonColor: Colors.grey,
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      checkboxValue!) {
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
              const BottomText(),
              const BottomText(text1: "Sick of this account?")
            ],
          ),
        ),
      ),
    );
  }

  void name() async {
    final input = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
    setState(() {
      myName = input;
    });
  }
}

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? buttonColor;
  const AppButton({Key? key, this.onPressed, required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(340, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        primary: buttonColor,
      ),
      child: const Text("Create your account"),
    );
  }
}
