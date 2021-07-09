import 'package:get/get.dart';
//
import 'package:my_gallarry/app/modules/auth/controller/login.controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
      permanent: true,
    );
  }
}
