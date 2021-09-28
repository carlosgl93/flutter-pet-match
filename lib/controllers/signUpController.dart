import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController? petNameController,
      userEmailController,
      passwordController,
      confirmPasswordController;
  var petName = '';
  var userEmail = '';
  var userPassword = '';
  var confirmUserPassword = '';

  void onInit() {
    super.onInit();
    petNameController = TextEditingController();
    userEmailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void onClose() {
    petNameController!.dispose();
    userEmailController!.dispose();
    passwordController!.dispose();
    confirmPasswordController!.dispose();
  }

  // Method to validate sign up form:
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

  String? verifyPasswords(String value, String userPassword) {
    log(userPassword);
    log(value);
    if (value != userPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // firebase Create user with email and password
  void createUserWithEmailAndPassword(userEmail, userPassword) async {
    // await
    return print('Creating user with email and password');
  }
}
