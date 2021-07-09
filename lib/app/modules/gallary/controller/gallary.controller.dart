import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

//
import 'package:my_gallarry/app/data/models/list_albums_response.dart';
import 'package:my_gallarry/app/data/models/album.dart';
import 'package:my_gallarry/app/data/models/create_album_request.dart';
import 'package:my_gallarry/app/modules/auth/controller/login.controller.dart';

class GallarryController extends GetxController {
  static GallarryController to = Get.find();
  LoginController loginCtl = LoginController.to;
  RxList<Album> albums = RxList<Album>();
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    listAlbums();
  }

  Future<void> createAlbum(CreateAlbumRequest request) async {
    await http.post(
      Uri.parse('https://photoslibrary.googleapis.com/v1/albums'),
      body: jsonEncode(request),
      headers: await loginCtl.currentUser!.value.authHeaders,
    );

    listAlbums();
  }

  void addAlbum(title) async {
    loading.value = true;
    update();
    await createAlbum(CreateAlbumRequest.fromTitle(title));
  }

  Future<void> listAlbums() async {
    albums.value = [];
    loading.value = true;
    update();
    final response = await http.get(
        Uri.parse('https://photoslibrary.googleapis.com/v1/albums?'
            'pageSize=50&excludeNonAppCreatedData=true'),
        headers: await loginCtl.currentUser!.value.authHeaders);
    var result = ListAlbumsResponse.fromJson(jsonDecode(response.body));
    if(result.albums != null) {
      albums.value = result.albums!;
    }
    loading.value = false;
    update();
  }
}
