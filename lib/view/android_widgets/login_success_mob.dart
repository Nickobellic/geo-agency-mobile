import "package:flutter/material.dart";

class LoginSuccessMobile extends StatefulWidget {
  const LoginSuccessMobile({super.key});

  @override
  State<LoginSuccessMobile> createState() {
    return LoginSuccessMobileState();
  }
}

class LoginSuccessMobileState extends State<LoginSuccessMobile> {

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
          ,Container(
          margin: EdgeInsets.only(left: 70.0),
        child: Center(
          child: Text("Authenticated Successfully", 
        style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),),) 
,
      )
        ],)
      
       
    );
  }
}