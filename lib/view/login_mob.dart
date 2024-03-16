import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "../repository/login_repo.dart";
import "../view_model/login_view_model.dart";
import '../model/User.dart';

// Login View -> User interactible UI

class LoginMobile extends ConsumerStatefulWidget {
  const LoginMobile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginMobileState();
  }
}

class _LoginMobileState extends ConsumerState<LoginMobile>  {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late LoginDetailsModelImpl ldModel;


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
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(loginVMProvider);

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
      onPressed: ()async {


        if(_formKey.currentState!.validate()) {
          print(passwordController.text); // Prints Password Text in the Console
          print(state.getOneFromApi()); // Sample DIO request to get User detail
          await state.validateUser(usernameController.text, passwordController.text); // Validates Login details and saves data inside Shared Preferences
          dynamic userInfo = await state.getUserFilledInfo(usernameController.text, passwordController.text); // Read data from Shared Preference
          print(userInfo); // Printing the data stored in Shared Preferences
          usernameController.clear();
          passwordController.clear();
        }

      }, ),
      ),

        ],
      )
      )
    );

      },
    );

      }
}