import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pet_match/screens/home.dart';

class AuthController extends GetxController {
  var displayName = ''; // to show the user name when signed in

  FirebaseAuth auth = FirebaseAuth.instance;

  User? get userProfile => auth.currentUser;

  void signUp(String name, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName = name;
        auth.currentUser!.updateDisplayName(displayName);
      });
      update();
      Get.offAll(() => HomeScreen());
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is to weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email';
      } else {
        message = e.message.toString();
      }

      Get.snackbar('An error ocurred', e.toString());

    } catch (e) {
      Get.snackbar('An error ocurred', e.toString());
    }
  }
}
