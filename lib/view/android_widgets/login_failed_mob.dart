import "package:flutter/material.dart";

class LoginFailureMobile extends StatefulWidget {
  const LoginFailureMobile({super.key});

  @override
  State<LoginFailureMobile> createState() {
    return LoginFailureMobileState();
  }
}

class LoginFailureMobileState extends State<LoginFailureMobile> {

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
            margin: EdgeInsets.fromLTRB(0.0,80.0,0,30.0),
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