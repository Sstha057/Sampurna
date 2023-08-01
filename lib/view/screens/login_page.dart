import 'package:flutter/material.dart';
import 'package:sampurna/view/screens/get_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  storedata(String UserData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("USER", UserData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Text(
        "Welcome To Login",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 30,
      ),
      Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return "Email is required";
                }
                if (!email.contains('@')) {
                  return "Please enter a valid email";
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: "Please Enter Username",
                  hintStyle:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  labelText: "Username",
                  labelStyle:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 8) {
                  return "Password must be  characters";
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: "Please Enter Password",
                  hintStyle:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  labelText: "Password",
                  labelStyle:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ),
            ElevatedButton(
                onPressed: () {
                  storedata(_emailController.text);
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ))
          ],
        ),
      ),
    ]));
  }
}
