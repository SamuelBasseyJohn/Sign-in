import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white54,
      ),
      //The App Body
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('images/Wallpaper.jpeg'))),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white70,
          ),
          //Create form builder that accepts the global key "_formKey" created earlier. (very essential)
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              //Created a form builder text field for input
              TextField(
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
                  hintText: "HomeName",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.all(20),
                ),
              ),

              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text("Go Back"),
                    onPressed: () => Navigator.pop(context, _homeName.text),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    child: const Text("Profile"),
                    onPressed: () => Navigator.pushNamed(context, '/Profile'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
