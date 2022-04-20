import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_flutter_assignment/profile.dart';
import 'package:my_flutter_assignment/settings.dart';
import 'widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _homeName = TextEditingController();
  //Create a key that can be used to access the forms
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      //The App Body
      drawer: const MyDrawer(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('images/Wallpaper.jpeg'))),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
              border: Border.all(
                width: 5,
                color: Colors.teal,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset.fromDirection(0.25, 10.0),
                  blurRadius: 10.0,
                )
              ]),
          //Create form builder that accepts the global key "_formKey" created earlier. (very essential)
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Welcome!",
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),

              //Created a form builder text field for input
              TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                controller: _homeName,
                obscureText: !_isVisible,
                decoration: InputDecoration(
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
                  hintText: "Enter a text",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(),
                  ),
                  contentPadding: const EdgeInsets.all(20),
                ),
              ),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
