import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

//
import 'package:my_gallarry/app/modules/gallary/album.page.dart';
import 'package:my_gallarry/app/modules/gallary/controller/gallary.controller.dart';
import 'package:my_gallarry/app/theme/theme.dart';

class Gallarry extends StatelessWidget {
  String albumName = "";

  Widget albumInput(GallarryController ctl) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 160,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text("Album name:"),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required ";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(217, 217, 217, 1), width: 1.0),
                  ),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(250, 250, 250, 1),
                  contentPadding: EdgeInsets.all(10),
                ),
                maxLength: 100,
                onChanged: (value) {
                  if (value.length <= 100) {
                    albumName = value;
                  }
                },
              ),
            ],
          ),
          RaisedButton(
            color: Color(0xff476cfb),
            onPressed: () {
              ctl.addAlbum(albumName == "" ? "New albums" : albumName);
              Get.back();
            },
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Gallarry"),
        backgroundColor: kPrimaryColor,
      ),
      body: GetBuilder<GallarryController>(
        init: GallarryController.to,
        builder: (ctl) {
          return ctl.loading.value
              ? Center(child: SpinKitCircle(color: Colors.blue))
              : Column(
                  children: [
                    RaisedButton(
                      color: Color(0xff476cfb),
                      onPressed: () {
                        Get.bottomSheet(albumInput(ctl),
                            backgroundColor: Colors.white);
                      },
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      child: Text(
                        "Add new album",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                    Expanded(
                      child: AlbumPage(),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
