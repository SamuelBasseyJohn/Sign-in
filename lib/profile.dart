import 'package:flutter/material.dart';
import 'package:my_flutter_assignment/Widgets/myDrawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/Settings"),
            icon: Icon(
              Icons.settings,
              size: 306456,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white54,
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/Samuel.jpeg'),
            ),
            const Text(
              "Samuel Bassey",
              style: TextStyle(
                  fontSize: 45.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
            const Text(
              "FLUTTER DEVELOPER",
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 3,
              ),
            ),
            SizedBox(
              height: 25,
              child: Divider(
                color: Colors.blue[900],
                indent: 100,
                endIndent: 100,
                thickness: 1,
              ),
            ),
            const Card(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: ListTile(
                    dense: true,
                    title: Text(
                      "+2347034847121",
                      style: TextStyle(fontSize: 17),
                    ),
                    subtitle: Text("Contact me here"),
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    )),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.mail,
                    color: Colors.red[300],
                    size: 25,
                  ),
                  title: const Text(
                    "Sammyjaybassey@gmail.com",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("Go Back"),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text("Settings"),
                  onPressed: () => Navigator.pushNamed(context, '/Settings'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
