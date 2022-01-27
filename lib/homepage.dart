import 'dart:io';

import 'package:cameraapp/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList;

  firstpage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondPage()));
  }

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  opensecondpage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondPage()));
  }

  opengallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  opencamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Menu"),
            ),
            ListTile(
              title: Text(
                "first page",
                style: TextStyle(color: Colors.blueAccent),
              ),
              onTap: () {
                firstpage();
              },
            ),
            ListTile(
              title: Text(
                "second page",
                style: TextStyle(color: Colors.blueAccent),
              ),
              onTap: () {
                opensecondpage();
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Camera"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                color: Colors.amber,
                width: double.infinity,
                height: 650,
                child: _imageFileList == null
                    ? Icon(
                        Icons.photo_camera,
                        color: Colors.green,
                        size: 50.0,
                      )
                    : Image.file(File(_imageFileList![0].path))),
            Container(
                margin: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        elevation: 20,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        onPressed: () {
                          opencamera();
                        },
                        child: Text(
                          "Open Camera",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        elevation: 20,
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        onPressed: () {
                          opengallery();
                        },
                        child: Text(
                          "Open Gallery",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        elevation: 20,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        onPressed: () {
                          opensecondpage();
                        },
                        child: Text(
                          "Second Page",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}
