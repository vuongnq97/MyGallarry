import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:my_gallarry/app/data/models/album.dart';
import 'package:path/path.dart' as path;

//
import 'package:my_gallarry/app/data/models/batch_create_media_items_request.dart';
import 'package:my_gallarry/app/data/models/media_item.dart';
import 'package:my_gallarry/app/data/models/search_media_items_request.dart';
import 'package:my_gallarry/app/data/models/search_media_items_response.dart';
import 'package:my_gallarry/app/modules/auth/controller/login.controller.dart';

class AlbumController extends GetxController {
  static AlbumController to = Get.find();
  LoginController loginCtl = LoginController.to;
  RxList<MediaItem> images = RxList<MediaItem>();
  Rx<Album> currentAlbum = Album().obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    currentAlbum.value = Get.arguments;
    getImages();
  }

  Future<SearchMediaItemsResponse> getImages() async {
    loading.value = true;
    update();
    SearchMediaItemsRequest request =
        SearchMediaItemsRequest.albumId(currentAlbum.value.id);
    final response = await http.post(
      Uri.parse('https://photoslibrary.googleapis.com/v1/mediaItems:search'),
      body: jsonEncode(request),
      headers: await loginCtl.currentUser!.value.authHeaders,
    );
    var result = SearchMediaItemsResponse.fromJson(jsonDecode(response.body));
    if (result.mediaItems != null) {
      images.value = result.mediaItems!;
    }
    loading.value = false;
    update();
    return SearchMediaItemsResponse.fromJson(jsonDecode(response.body));
  }

  inAlbum(String uploadToken, String albumId, String description) {
    return BatchCreateMediaItemsRequest(
        albumId,
        <NewMediaItem>[NewMediaItem.simple(uploadToken, description)],
        AlbumPosition.lastInAlbum());
  }

  Future<void> batchCreateMediaItems(
      BatchCreateMediaItemsRequest request) async {
    print(request.toJson());
    final response = await http.post(
      Uri.parse(
          'https://photoslibrary.googleapis.com/v1/mediaItems:batchCreate'),
      body: jsonEncode(request),
      headers: await loginCtl.currentUser!.value.authHeaders,
    );
  }

  Future<void> createMediaItem(
      String uploadToken, String albumId, String description) async {
    final request = inAlbum(uploadToken, albumId, description);

    await batchCreateMediaItems(request);
    getImages();
  }

  void contributePhoto(uploadToken) async {
    await createMediaItem(
        uploadToken, currentAlbum.value.id!, "This is image description");
  }

  Future<void> uploadMediaItem(File image) async {
    try {
      loading.value = true;
      update();
      final filename = path.basename(image.path);
      final headers = <String, String>{};
      headers.addAll(
        await loginCtl.currentUser!.value.authHeaders,
      );
      headers['Content-type'] = 'application/octet-stream';
      headers['X-Goog-Upload-Protocol'] = 'raw';
      headers['X-Goog-Upload-File-Name'] = filename;

      final response = await http.post(
        Uri.parse('https://photoslibrary.googleapis.com/v1/uploads'),
        body: image.readAsBytesSync(),
        headers: headers,
      );

      contributePhoto(response.body);
    } catch (e) {
      throw e;
    }
  }
}
