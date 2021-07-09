import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
//

class PickedImageCompress extends StatefulWidget {
  final PickedFile image;
  final bool shouldCompress;
  final Function(File) onFileCompressed;

  const PickedImageCompress({
    Key? key,
    required this.image,
    required this.onFileCompressed,
    this.shouldCompress = false,
  }) : super(key: key);

  @override
  _PickedImageCompressState createState() => _PickedImageCompressState();
}

class _PickedImageCompressState extends State<PickedImageCompress> {
  bool _isInit = true;
  late PickedFile _compressedFile;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      if (widget.shouldCompress) {
        _compressImage(widget.image);
      }
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  Future<void> _compressImage(PickedFile file) async {
    try {
      String absolutePath = file.path;
      List<String> pathData = absolutePath.split('/');
      String fileName = pathData.last.split('.').first;
      pathData.removeLast();
      String targetPath = pathData.join('/') + '${fileName}_compressed.jpg';
      File result = (await FlutterImageCompress.compressAndGetFile(
        absolutePath,
        targetPath,
        quality: 90,
        minWidth: 1024,
        minHeight: 1024,
      ))!;

      setState(() {
        // _compressedFile = result;
      });
      widget.onFileCompressed(result);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    File previewFile;
    if (widget.shouldCompress && _compressedFile != null) {
      // previewFile = _compressedFile;
    } else {
      //  previewFile = widget.image;
    }
    /* if (previewFile != null) {
      return PhotoView(
        imageProvider: FileImage(
          previewFile,
          scale: 1.0,
        ),
      );
    }*/
    return Container();
  }
}
