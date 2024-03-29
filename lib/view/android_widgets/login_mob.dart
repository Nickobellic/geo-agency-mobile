import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:geo_agency_mobile/view/android_widgets/login_success_mob.dart";
import "package:geo_agency_mobile/view/android_widgets/login_failed_mob.dart";
import '../../view_model/login_view_model.dart';
import "../rules/login_validation.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Login View -> User interactible UI

class LoginMobile extends HookConsumerWidget {  // ConsumerStatefulWidget

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late LoginDetailsModelImpl ldModel; // Instance of View Model defined


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameText = useState('');
    final passwordText = useState('');
    return Consumer(  // Use Consumer to access the Provider methods
      builder: (context, ref, child) {
        final state = ref.watch(loginVMProvider); // Using the View Model Provider

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
        validator: (value) => LoginValidation.validateTextField(value, "Username"),
        onChanged: (value) => usernameText.value = value,
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
        validator: (value) => LoginValidation.validateTextField(value, "Password"),
        onChanged:(value) => passwordText.value = value,
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
          //print(passwordController.text); // Prints Password Text in the Console
          dynamic userDetail =  await state.getOneFromApi(); // Sample DIO request to get User detail
          //print(userDetail);
          Map<String,dynamic> existingUser = await state.validateUser(usernameText.value, passwordText.value); // Validates Login details and saves data inside Shared Preferences
          dynamic userInfo = await state.getUserFilledInfo(usernameText.value, passwordText.value); // Read data from Shared Preference
          print(existingUser); // Printing the data stored in Shared Preferences

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(existingUser["message"]), 
            action: SnackBarAction(label: 'OK', onPressed: () =>{
              ScaffoldMessenger.of(context).hideCurrentSnackBar()
            }),
            duration: const Duration(milliseconds: 2000),
            ),
          );
          if(existingUser["valid"] == true) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginSuccessMobile()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginFailureMobile()),
            );
          } 
          usernameText.value = '';
          passwordText.value = '';

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