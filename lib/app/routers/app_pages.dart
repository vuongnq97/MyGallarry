import 'package:get/get.dart';

//
import 'package:my_gallarry/app/modules/auth/binding/login.binding.dart';
import 'package:my_gallarry/app/modules/auth/login_google.dart';
import 'package:my_gallarry/app/modules/gallary/album.details.page.dart';
import 'package:my_gallarry/app/modules/gallary/binding/album.binding.dart';
import 'package:my_gallarry/app/modules/gallary/binding/gallarry.binding.dart';
import 'package:my_gallarry/app/modules/gallary/gallarry.page.dart';

//

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.GALLARRY,
      page: () => Gallarry(),
      binding: GallarryBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginGoogle(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ALBUM_DETAIL,
      page: () => AlbumDetailPage(),
      binding: AlbumBinding(),
    ),
  ];
}
