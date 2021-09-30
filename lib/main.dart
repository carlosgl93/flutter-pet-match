import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet_match/controllerBindings.dart';
import 'package:pet_match/screens/home.dart';

import 'package:pet_match/screens/login.dart';
import 'package:pet_match/screens/signup.dart';
import 'package:pet_match/widgets/candidateDetail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PetMatch());
}

class PetMatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // bind the app with the GetX controller
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(
          name: '/profile/:candidateId',
          page: () => CandidateDetail()
        )
      ],
    );
  }
}
