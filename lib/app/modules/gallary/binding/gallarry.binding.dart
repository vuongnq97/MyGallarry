import 'package:get/get.dart';
//
import 'package:my_gallarry/app/modules/gallary/controller/gallary.controller.dart';

class GallarryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GallarryController>(
      GallarryController(),
      permanent: true,
    );
  }
}
