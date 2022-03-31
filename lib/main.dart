import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';

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
      ),
      home: const CreateYourAccount(title: "Create Your Account"),
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
   bool? value = false;
  @override
  Widget build(BuildContext context) {
    // Scaffold
    return Scaffold(
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
                    margin:
                        const EdgeInsets.fromLTRB(15,40,15,20),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    // I used this to add a border radius to the Container
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        // Row for the title 'Create your account'
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25.0),
                              child: Text(
                                "Create your account",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Set line below this widget to divide the Title from input
                        const Divider(
                          color: Colors.black,
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                20.0,
                                20.0,
                                20.0,
                                5.0,
                              ),
                              child: Text(
                                "Full legal first and middle name(s) ",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            20.0,
                            15.0,
                          ),
                          child: TextField(
                            controller: _firstAndMiddleName,
                            decoration: const InputDecoration(
                              hintText: "Full legal first and middle name(s)",
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "Full legal Surname",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            20.0,
                            15.0,
                          ),
                          child: TextField(
                            controller: _surname,
                            decoration: const InputDecoration(
                              hintText: "Full legal Surname",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            20.0,
                            15.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],

                                      // borderRadius: BorderRadius.only(
                                      //   topLeft: Radius.circular(8),
                                      //   bottomLeft: Radius.circular(8),
                                      //
                                      // ),
                                  border: Border(
                                    top: BorderSide(width: 1.0, color: Colors.grey),
                                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                                    left: BorderSide(width: 1.0, color: Colors.grey)
                                  ),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: CountryCodePicker(
                                    closeIcon: Icon(Icons.close ),
                                    initialSelection: 'ng',
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  controller: _phoneNumber,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.phone_android),
                                    hintText: "Phone Number",
                                    label: Text("Phone Number"),
                                    prefixText: (""),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "Email address ",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            20.0,
                            15.0,
                          ),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _email,
                            decoration: const InputDecoration(
                              prefixIcon: const Icon(Icons.mail),
                              hintText: "Email",
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "Password ",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            20.0,
                            15.0,
                          ),
                          child: TextField(
                            obscureText: true,
                            controller: _password,
                            decoration: const InputDecoration(
                              prefixIcon: const Icon(Icons.password),
                              suffixIcon: const Icon(Icons.visibility),
                              hintText: "Password",
                              border: OutlineInputBorder(),
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
                                  value: value,
                                  onChanged: ( value){
                                    setState(() {
                                      this.value = value;
                                    });
                                  },
                                ),
                              ),
                             Expanded(
                               flex: 4,
                               child: const
                               Text(
                                  "I confirm the information provided is correct as they appear on my legal document",
                                ),
                             ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Account Created");
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(340, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            primary: Colors.grey[350],
                          ),
                          child: Text("Create your account"),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("Got an account?"),
                   TextButton(
                     child: Text("Sign in", style: TextStyle(color: Colors.black) ),
                     onPressed: () {
                       print("Account Created");

                     },
                     )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

enum Country { ng, us, uk, gh }
