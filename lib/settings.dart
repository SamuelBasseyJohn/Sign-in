import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white54,
      ),
      drawer: Drawer(
        backgroundColor: Colors.teal,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 60,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Your App sha",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 30)),
                onPressed: () => Navigator.pushNamed(context, '/Profile'),
                child: const Text("Profile")),
            SizedBox(
              height: 1,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 30)),
                onPressed: () => Navigator.pushNamed(context, '/Home'),
                child: const Text("Home")),
            SizedBox(
              height: 1,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 30)),
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: const Text("Sign Up")),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("Go Back"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
