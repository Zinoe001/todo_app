import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:todo_app/core/utils/texts.dart';

class TodoFlushbar {
  showError(BuildContext context,{required String title,required String message}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      titleText: AppText.heading3(text: title,color: Colors.white,),
      messageText: AppText.body(text: message,color: Colors.white,),
    )..show(context);
  }

  showSuccessful(BuildContext context,{required String title,required String message}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
      titleText: AppText.heading3(text: title,color: Colors.white,),
      messageText: AppText.body(text: message,color: Colors.white,),
    )..show(context);
  }
}
