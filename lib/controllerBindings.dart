import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import './services/auth.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => (AuthController()));
  }
}
