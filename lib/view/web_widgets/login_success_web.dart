import "package:flutter/material.dart";

class LoginSuccessWeb extends StatefulWidget {
  const LoginSuccessWeb({super.key});

  @override
  State<LoginSuccessWeb> createState() {
    return LoginSuccessWebState();
  }
}

class LoginSuccessWebState extends State<LoginSuccessWeb> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Status'),
      ),
      body: Column(
        children: [
          Container(
            width: 400.0,
            height: 300.0,
            child: Center(
              child:             Image(
              image: const AssetImage('assets/images/auth_success.jpg'),)
              ,) 
,
          )
          ,Center(
        child: Text("Authenticated Successfully", 
        style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),),
      )
        ],)
      
       
    );
  }
}