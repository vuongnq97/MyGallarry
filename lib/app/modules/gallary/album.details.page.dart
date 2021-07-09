import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

//
import 'package:my_gallarry/app/data/models/media_item.dart';
import 'package:my_gallarry/app/modules/gallary/controller/album.controller.dart';
import 'package:my_gallarry/app/theme/theme.dart';
import 'package:my_gallarry/app/widgets/upload_button.dart';

class AlbumDetailPage extends StatelessWidget {
  Widget imageItem(MediaItem item) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.1),
        image: DecorationImage(
          image: NetworkImage(item.baseUrl!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlbumController>(
        init: AlbumController.to,
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text(ctl.currentAlbum.value.title!),
              backgroundColor: kPrimaryColor,
            ),
            body: ctl.loading.value
                ? Center(child: SpinKitCircle(color: Colors.blue))
                : Column(
                    children: [
                      UploadButton(
                        onSelectedImage: (file) {
                          ctl.uploadMediaItem(file);
                        },
                      ),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          primary: true,
                          padding: const EdgeInsets.all(10),
                          itemCount: ctl.images.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            MediaItem img = ctl.images[index];
                            return imageItem(img);
                          },
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
