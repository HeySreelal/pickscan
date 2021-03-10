import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickSomePic extends StatefulWidget {
  @override
  _PickSomePicState createState() => _PickSomePicState();
}

class _PickSomePicState extends State<PickSomePic> {
  ImagePicker _picker;
  String _defaultPic = "https://storage.googleapis.com/support-forums-api/avatar/profile-475928-16896033272965631849.jpg";
  File _pic;
  Future _takePic(bool x) async {
    PickedFile _xFile = await _picker.getImage(source: x ? ImageSource.camera : ImageSource.gallery);
    if(_xFile == null) return null;
    setState(() {
      _pic = File(_xFile.path);
    });
  }

  @override
  void initState() {
    _picker = ImagePicker();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take A Pic"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _pic == null ? Image.network(_defaultPic) : Image.file(_pic),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: "camera-pic",
                    child: Icon(Icons.camera),
                    onPressed: () => _takePic(true),
                  ),
                  FloatingActionButton(
                    heroTag: "gallery-pic",
                    child: Icon(Icons.photo),
                    onPressed: () => _takePic(false),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
