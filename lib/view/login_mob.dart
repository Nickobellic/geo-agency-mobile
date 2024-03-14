import "package:flutter/material.dart";

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginMobileState();
  }
}

class _LoginMobileState extends State<StatefulWidget> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
          Container(      
            margin: EdgeInsets.symmetric(horizontal: 25.0),        // Username Field
          child: TextField(
        obscureText: false,
        controller: usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Center(child: Text('Username'),),
        ),
      )),
      Container(                // Password Field
          margin: const EdgeInsets.only(top: 50.00, left: 25.0, right: 25.0),
          alignment: Alignment.center,
          child: TextField(
        obscureText: true,
        controller: passwordController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Center(child: Text('Password'),),
        ),
      )),
      Container(
        margin: EdgeInsets.only(top: 30.00),
        alignment: Alignment.center,
        child: ElevatedButton(
        child: const Text('Submit'),
      onPressed: () {
        print(passwordController.text);
        usernameController.clear();
        passwordController.clear();

      }, ),
      ),

        ],
      )
    );
  }
}