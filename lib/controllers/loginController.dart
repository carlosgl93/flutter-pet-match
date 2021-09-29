import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController? emailController, passwordController;

  var userEmail = '';
  var userPassword = '';

  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void onClose() {
    emailController!.dispose();
    passwordController!.dispose();
  }

  // methods to validate de email and password
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length <= 6) {
      return 'Enter a password longer than 6 characters';
    }
    return null;
  }

  
}
