import 'package:flutter/material.dart';
import 'package:my_flutter_assignment/sign_in.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          // borderRadius: BorderRadius.only(
          //     topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
      backgroundColor: Colors.grey[200],
      child: ListView(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: const [
          //     CircleAvatar(
          //       backgroundImage: AssetImage('images/Wallpaper.jpeg'),
          //       radius: 60,
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Text(
          //       "Your App sha",
          //       style: TextStyle(fontSize: 20),
          //     )
          //   ],
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // TextButton(
          //     style: TextButton.styleFrom(
          //         primary: Colors.black,
          //         backgroundColor: Colors.white,
          //         padding: const EdgeInsets.symmetric(vertical: 30)),
          //     onPressed: () => Navigator.pushNamed(context, '/Profile'),
          //     child: const Text("Profile")),
          // const SizedBox(
          //   height: 1,
          // ),
          // TextButton(
          //     style: TextButton.styleFrom(
          //         primary: Colors.black,
          //         backgroundColor: Colors.white,
          //         padding: const EdgeInsets.symmetric(vertical: 30)),
          //     onPressed: () => Navigator.pushNamed(context, '/Home'),
          //     child: const Text("Home")),
          // const SizedBox(
          //   height: 1,
          // ),
          // TextButton(
          //     style: TextButton.styleFrom(
          //         primary: Colors.black,
          //         backgroundColor: Colors.white,
          //         padding: const EdgeInsets.symmetric(vertical: 30)),
          //     onPressed: () => Navigator.pushNamed(context, '/Settings'),
          //     child: const Text("Settings")),
          DrawerHeader(
              margin: const EdgeInsets.fromLTRB(5, 5, 0, 10),
              padding: const EdgeInsets.symmetric(vertical: 5),
              duration: const Duration(milliseconds: 250),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Samuel.jpeg'),
                      radius: 50,
                    ),
                    ListTile(
                      title: Text(
                        "Samuel Bassey John",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text("Sammyjaybassey@gmail.com"),
                      dense: true,
                    )
                  ],
                ),
              ])),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_rounded),
            title: const Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, '/Profile');
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, '/Settings');
            },
          ),

          ListTile(
            leading: const Icon(Icons.exit_to_app_sharp),
            title: const Text("Sign-out"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SignIn()));
            },
          ),

          Divider(
            color: Colors.grey[600],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
