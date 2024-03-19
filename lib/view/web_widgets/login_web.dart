import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import '../../view_model/login_view_model.dart';
import '../web_widgets/login_success_web.dart';
import '../web_widgets/login_failed_web.dart';

// Login View -> User interactible UI

class LoginWeb extends ConsumerStatefulWidget {  // ConsumerStatefulWidget
  const LoginWeb({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginWebState();
  }
}

class _LoginWebState extends ConsumerState<LoginWeb>  { // Use ConsumerState<View>

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late LoginDetailsModelImpl ldModel; // Instance of View Model defined


  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer(  // Use Consumer to access the Provider methods
      builder: (context, ref, child) {
        final state = ref.watch(loginVMProvider); // Using the View Model Provider

        return Scaffold(
      appBar: AppBar(
        title: const Text("Login (Web)"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("Username",
          
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)
            ,SizedBox(      
         // Username Field
          width: 300.0,
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
      ))
          ])
          ,SizedBox(height: 50,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ,children: [
            Text('Password', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            SizedBox(     
        width: 300.0,           // Password Field
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
          ])
          ,
      
      Container(
        margin: EdgeInsets.only(top: 50.00),
        alignment: Alignment.center,
        child: Column(children: [
        ElevatedButton(
        style: TextButton.styleFrom(padding: const EdgeInsets.all(20.0)),
        child: const Text('Submit', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      onPressed: ()async {


        if(_formKey.currentState!.validate()) {
          //print(passwordController.text); // Prints Password Text in the Console
          //print(await state.getOneFromApi()); // Sample DIO request to get User detail
          dynamic existingUser = await state.validateUser(usernameController.text, passwordController.text); // Validates Login details and saves data inside Shared Preferences
          dynamic userInfo = await state.getUserFilledInfo(usernameController.text, passwordController.text); // Read data from Shared Preference
          print(existingUser); // Prints the Shared Preferences

          if(existingUser == true) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginSuccessWeb()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginFailureWeb()),
            );
          } 

          usernameController.clear();
          passwordController.clear();
        }

      }, )
        ],)
        
,
      ),

        ],
      )
      )
    );

      },
    );

      }
}