import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class UploadButton extends StatefulWidget {
  Function(File) onSelectedImage;

  UploadButton({Key? key, required this.onSelectedImage}) : super(key: key);

  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  late File _image;
  late ImagePicker _imagePicker = new ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future getImage() async {
    PickedFile image =
        (await _imagePicker.getImage(source: ImageSource.gallery))!;

    setState(() {
      _image = File(image.path);
      this.widget.onSelectedImage(_image);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            color: Color(0xff476cfb),
            onPressed: () {
              getImage();
            },
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            child: Text(
              "Upload Image",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
