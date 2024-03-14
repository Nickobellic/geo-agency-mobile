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
  final _formKey = GlobalKey<FormState>();


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
      body: Form(
        key: _formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          Container(      
            margin: EdgeInsets.symmetric(horizontal: 25.0),        // Username Field
          child: TextFormField(
        validator: (value) {
          if(value == null || value.isEmpty) {
            return 'Enter the Username';
          }
        },
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
          child: TextFormField(
        obscureText: true,
        controller: passwordController,
        validator: (value) {
          if(value == null || value.isEmpty) {
            return "Enter the Password";
          }
        },
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
        if(_formKey.currentState!.validate()) {
          print(passwordController.text);
          usernameController.clear();
          passwordController.clear();
        }

      }, ),
      ),

        ],
      )
      )
    );
  }
}