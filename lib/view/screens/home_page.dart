import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 1;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    userData();
  }

  userData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString("USER");
    setState(() {
      userEmail = email;
    });
  }

  clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
