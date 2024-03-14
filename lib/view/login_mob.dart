import "package:flutter/material.dart";

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginMobileState();
  }
}

class _LoginMobileState extends State<StatefulWidget> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          Container(              // Username Field
          child: const TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
          contentPadding: EdgeInsets.symmetric(horizontal: 150.00)
        ),
      )),
      Container(                // Password Field
          margin: const EdgeInsets.only(top: 50.00),
          alignment: Alignment.center,
          child: const TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          contentPadding: EdgeInsets.symmetric(horizontal: 150.00)
        ),
      ))
        ],
      )
    );
  }
}