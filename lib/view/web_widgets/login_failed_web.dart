import "package:flutter/material.dart";

class LoginFailureWeb extends StatefulWidget {
  const LoginFailureWeb({super.key});

  @override
  State<LoginFailureWeb> createState() {
    return LoginFailureWebState();
  }
}

class LoginFailureWebState extends State<LoginFailureWeb> {

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
            margin: EdgeInsets.fromLTRB(0.0,100.0,0,50.0),
            width: 400.0,
            height: 300.0,
            child: Center(
              child:             Image(
              image: const AssetImage('assets/images/auth_fail.jpg'),)
              ,) 
,
          )
          ,Center(
        child: Text("Unauthorized User", 
        style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),),
      )
        ],)
      
       
    );
  }
}