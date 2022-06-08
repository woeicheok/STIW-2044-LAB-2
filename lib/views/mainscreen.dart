import 'package:flutter/material.dart';
import 'package:mytutor/views/registerscreen.dart';
import '../model/user.dart';
import 'loginscreen.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tutor'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget.user.name.toString()),
            accountEmail: Text(widget.user.email.toString()),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn.myanimelist.net/r/360x360/images/characters/9/310307.jpg?s=56335bffa6f5da78c3824ba0dae14a26"),
            ),
          ),
          _createDrawerItem(
              icon: Icons.man_outlined, text: 'Find Tutors', onTap: () {}),
          _createDrawerItem(
              icon: Icons.picture_in_picture, text: 'My Profile', onTap: () {}),
          _createDrawerItem(
              icon: Icons.verified_user,
              text: 'User Registration',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (content) => const RegisterScreen()))),
          _createDrawerItem(
              icon: Icons.logout,
              text: 'Log Out',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (content) => const LoginScreen()))),
        ],
      )),
      body: Center(
        child: Container(
          child: const Text('Hello World'),
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(padding: const EdgeInsets.only(left: 8.0), child: Text(text))
        ],
      ),
      onTap: onTap,
    );
  }
}
