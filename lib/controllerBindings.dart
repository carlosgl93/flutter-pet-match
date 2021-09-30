import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import './services/auth.dart';
import './controllers/homeController.dart';
import './controllers/loginController.dart';
import './controllers/signUpController.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => (AuthController()));
    Get.lazyPut<SignUpController>(() => (SignUpController()));
    Get.lazyPut<LoginController>(() => (LoginController()));
    Get.lazyPut<HomeController>(() => (HomeController()));
  }
}
