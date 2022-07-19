import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:image_picker/image_picker.dart';

class Storey2 extends StatefulWidget {
  const Storey2({Key? key}) : super(key: key);

  @override
  _Storey2State createState() => _Storey2State();
}

final myController = TextEditingController();

File? singleImage;

File? croppedFile;

final singlePicker = ImagePicker();

class _Storey2State extends State<Storey2> {
  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            maxLines: 7,
            controller: myController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText:
                  '당신에 대해 이야기해주세요.\n매력적인 스토리는 친구들에게 공감을\n많이 받을 수 있습니다.\n\n카카오톡 아이디 또는 메신저 등 개인 연락처를\n노출할 경우에는 스토리가 비노출 됩니다.',
              hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
            ),
            keyboardType: TextInputType.emailAddress,
            onTap: () {},
          ),
        ),
        singleImage == null
            ? Container()
            : Stack(
                children: [
                  Image.file(
                    singleImage!,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 355.0,
                    child: GestureDetector(
                      child: Icon(
                        Icons.cancel_rounded,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          singleImage = null;
                        }); // 사진 지우기
                      },
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  primary: Color.fromARGB(255, 250, 249, 249),
                  elevation: 0.0),
              onPressed: () {
                _pickimage();
              },
              label: Text(
                '사진추가',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 17.0),
              ),
              icon: Icon(
                Icons.filter,
                color: Colors.pink,
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(),
        elevation: 0.0,
        title: Text(
          '스토리 작성',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '등록',
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(7.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 6.0),
            width: MediaQuery.of(context).size.width / 1.0,
            height: MediaQuery.of(context).size.height / 500.0,
            color: Color.fromARGB(255, 248, 245, 245),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _body(),
            // _bodybottom(),
          ],
        ),
      ),
    );
  }

  Future<void> _pickimage() async {
    final pickedImage = await singlePicker.pickImage(
      source: (ImageSource.gallery),
    );
    if (pickedImage != null) {
      singleImage = File(pickedImage.path);
    }
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: singleImage!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: '사진 편집',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: '사진 편집',
          doneButtonTitle: '완료',
          cancelButtonTitle: '나가기',
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      setState(() {
        singleImage = croppedFile;
      });
    }
  }
}
