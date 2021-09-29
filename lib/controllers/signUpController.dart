import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController? petNameController,
      userEmailController,
      passwordController;
  // confirmPasswordController;
  var petName = '';
  var userEmail = '';
  var userPassword = '';
  // var confirmUserPassword = '';

  void onInit() {
    super.onInit();
    petNameController = TextEditingController();
    userEmailController = TextEditingController();
    passwordController = TextEditingController();
    // confirmPasswordController = TextEditingController();
  }

  void onClose() {
    petNameController!.dispose();
    userEmailController!.dispose();
    passwordController!.dispose();
    // confirmPasswordController!.dispose();
  }

  

  
}
