import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//
import 'package:my_gallarry/app/data/models/album.dart';
import 'package:my_gallarry/app/modules/gallary/controller/gallary.controller.dart';
import 'package:my_gallarry/app/routers/app_pages.dart';

class AlbumPage extends StatelessWidget {
  Widget albumItem(Album album) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ALBUM_DETAIL, arguments: album);
      },
      child: Container(
        child: Column(
          children: [
            Image.asset(
              'assets/images/folder.png',
              fit: BoxFit.contain,
              width: 100.0,
              height: 100.0,
            ),
            Text(album.title!),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GallarryController>(
        init: GallarryController.to,
        builder: (ctl) {
          return GridView.builder(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(0),
            itemCount: ctl.albums.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (BuildContext context, int index) {
              Album album = ctl.albums[index];
              return albumItem(album);
            },
          );
        });
  }
}
