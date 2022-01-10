import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Procedure3 extends StatefulWidget {
  Procedure3({Key? key}) : super(key: key);

  @override
  _Procedure3State createState() => _Procedure3State();
}

class _Procedure3State extends State<Procedure3> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _selectedFiles = [];
  final List<String> _arrImageUrls = [];
  final FirebaseStorage _storageRef = FirebaseStorage.instance;

  void uploadFunction(List<XFile> _images) {
    for (int i = 0; i < _images.length; i++) {
      var imageUrl = uploadFile(_images[i]);
      _arrImageUrls.add(imageUrl.toString());
    }
  }

  Future<String> uploadFile(XFile _image) async {
    Reference reference = _storageRef.ref().child("images").child(_image.name);
    UploadTask uploadTask = reference.putFile(File(_image.path));
    await uploadTask.whenComplete(() {
      print(reference.getDownloadURL());
    });
    return await reference.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: () {
                uploadFunction(_selectedFiles);
              },
              child: const Text('업로드'))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  selectImage();
                },
                icon: Icon(Icons.add),
              ),
              _selectedFiles.length == 0
                  ? const Text('이미지를 넣어주세요.')
                  : Expanded(
                      child: GridView.builder(
                          itemCount: _selectedFiles.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.file(
                                File(_selectedFiles[index].path),
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectImage() async {
    if (_selectedFiles != null) {
      _selectedFiles.clear();
    }
    try {
      final List<XFile>? imgs = await _picker.pickMultiImage();
      setState(() {
        if (imgs!.isNotEmpty) {
          _selectedFiles.addAll(imgs);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
