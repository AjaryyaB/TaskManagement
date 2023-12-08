import 'package:flutter/material.dart';

import 'package:toastification/toastification.dart';
class Toastify{
  static void successToast(BuildContext context,String msg){
    
    toastification.show(context: context, title: msg, autoCloseDuration: const Duration(seconds: 5),
     closeOnClick: true,
    //backgroundColor: Colors.green,
        type: ToastificationType.success
    );
  }
  static void failureToast(BuildContext context,String msg){
    
    toastification.show(context: context, title: msg, autoCloseDuration: const Duration(seconds: 5),
    closeOnClick: true,
    backgroundColor: Colors.red,
        type: ToastificationType.error
    );
  }
}