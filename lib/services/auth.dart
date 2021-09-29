import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pet_match/screens/home.dart';
import 'package:pet_match/screens/login.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  var displayName = ''; // to show the user name when signed in
  var isSignedIn = false.obs;

  Stream<User?>? firebaseUser;

  User? get userProfile => auth.currentUser;
  String? get userEmail => userProfile!.email;

  @override
  void onInit() {
    if (auth.currentUser == null) {
      Get.toNamed('/');
    } else {
      firebaseUser = auth.authStateChanges();
      displayName = userProfile != null ? userProfile!.displayName! : '';
    }

    super.onInit();
  }

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

      Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('An error ocurred', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signIn(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayName = userProfile!.displayName!);

      update();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == 'wrong-password') {
        message = 'Incorrect password. Please try again';
      } else if (e.code == 'user-not-found') {
        message =
            'The account does not exist for $email. Create your account by signing up.';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('An error ocurred', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      displayName = '';
      isSignedIn.value = false;
      update();
      Get.offAll(LoginScreen());
    } catch (e) {
      Get.snackbar('An error ocurred', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Method to validate sign up form:
  String? validatePetName(String value) {
    if (!GetUtils.isAlphabetOnly(value)) {
      return 'What a nice name';
    }
    return null;
  }

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
    if (value != userPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
