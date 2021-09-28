import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signUpController.dart';

class SignUpScreen extends GetView<SignUpController> {

  @override
  Widget build(BuildContext context) {

    // global key to identify signup form;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

    void checkSignUp() {
    final isValid = signUpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signUpFormKey.currentState!.save();
  }

    final SignUpController controller = Get.put(SignUpController());
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // MAIN BODY OF THE SCREEN
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(
          vertical: height * 0.1,
          horizontal: width * 0.05,
        ),
        width: width,
        height: height,
        child: SingleChildScrollView(
          // START OF THE SIGN UP FORM
            child: Form(
          // key: controller.signUpFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Image.asset(
                'images/pet-match.png',
                width: width * 0.5,
              ),
              SizedBox(height: height * 0.025),
              Text('Create an account for your most loved one!'),
              SizedBox(height: height * 0.025),
              TextFormField(
                controller: controller.userEmailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  controller.userEmail = value!;
                },
                validator: (value) {
                  return controller.validateEmail(value!);
                },
              ),
              SizedBox(height: height * 0.025),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onSaved: (value) {
                  controller.passwordController =
                      value as TextEditingController?;
                },
                validator: (value) {
                  return controller.validatePassword(value!);
                },
              ),
              // TODO: ADD A PASSWORD VERIFIER
              // SizedBox(height: height * 0.025),
              // TextFormField(
              //   controller: controller.confirmPasswordController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10)),
              //     labelText: 'Verify Password',
              //     prefixIcon: Icon(Icons.lock),
              //   ),
              //   keyboardType: TextInputType.visiblePassword,
              //   obscureText: true,
              //   onSaved: (value) {
              //     controller.passwordController =
              //         value as TextEditingController?;
              //   },
              //   validator: (value) {
              //     return controller.verifyPasswords(value!, controller.userPassword);
              //   },
              
              SizedBox(height: height * 0.025),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: width),
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[900]),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(14),
                      ),
                    ),
                    child: Text('Create Account'),
                    onPressed: () {
                      checkSignUp();
                    }),
              ),
              SizedBox(height: height * 0.025),
              Text('You already have an account?'),
              SizedBox(height: height * 0.025),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: width),
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[900]),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(14),
                      ),
                    ),
                    child: Text('Sign in to your account!'),
                    onPressed: () {
                      Get.toNamed('/');
                    }),
              ),
            ],
          ),
        )),
      )),
    );
  }
}
