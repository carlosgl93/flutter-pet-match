import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/loginController.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    // global key used to identified form uniquely:
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    void checkLogin() {
    final isValid =   loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }
    final LoginController controller = Get.put(LoginController());
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(
          vertical: height * 0.1,
          horizontal: width * 0.05,
        ),
        width: width,
        height: height,
        child: SingleChildScrollView(
            child: Form(
          key: loginFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Image.asset(
                'images/pet-match.png',
                width: width * 0.5,
              ),
              SizedBox(height: height * 0.025),
              Text('Find a couple for your pet!'),
              SizedBox(height: height * 0.025),
              TextFormField(
                controller: controller.emailController,
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
                    child: Text('Login'),
                    onPressed: () {
                      checkLogin();
                    }),
              ),
              SizedBox(height: height * 0.025),
              Text('Don\'t have an account yet?'),
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
                    child: Text('Sign Up!'),
                    onPressed: () {
                      Get.toNamed('/signup');
                    }),
              ),
            ],
          ),
        )),
      )),
    );
  }
}