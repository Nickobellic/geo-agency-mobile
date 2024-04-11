import 'package:flutter/material.dart';
import 'Globals.dart';

class GlobalSnackBar {
  final String message;
  //final String key;

  const GlobalSnackBar({
    required this.message,
  });

  void show(
  ) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        elevation: 0.0,
        //behavior: SnackBarBehavior.floating,
        content: Text(message),
        duration: new Duration(milliseconds: 3000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ),
        //backgroundColor: Colors.redAccent,
        action: SnackBarAction(
          textColor: Color(0xFFFAF2FB),
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }
}