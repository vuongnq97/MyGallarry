import 'package:get/get.dart';
//
import 'package:my_gallarry/app/modules/gallary/controller/album.controller.dart';

class AlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AlbumController>(
      AlbumController(),
    );
  }
}
