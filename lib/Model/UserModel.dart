// import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UserModel {
  String? age;
  String? uid;
  String? name;
  String? gender;
  String? number;
  String? email;
  String? aboutMe;
  String? height;
  // String? mbti;
  String? job;
  String? smoking;
  String? religion;
  String? distance;
  String? address;
  // String? tag;
  String? imageURL;
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.gender,
    this.number,
    this.age,
    this.aboutMe,
    this.height,
    // this.mbti,
    this.job,
    this.smoking,
    this.religion,
    this.imageURL,
    this.distance,
    this.address,
    // this.tag,
  });
  // 서버에서 데이터 수신
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['이름'],
      gender: map['성별'],
      age: map['나이'],
      number: map['번호'],
      email: map['이메일'],
      aboutMe: map['자기소개'],
      height: map['키'],
      // mbti: map['MBTI'],
      job: map['직업'],
      smoking: map['흡연여부'],
      religion: map['종교'],
      // tag: map['태그'],
      imageURL: map['사진'],
      distance: map['거리'],
      address: map['거주지'],
    );
  }

  // 우리 서버에 데이터 보내기
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      '이메일': email,
      '이름': name,
      '성별': gender,
      '나이': age,
      '번호': number,
      '자기소개': aboutMe,
      '키': height,
      // 'MBTI': mbti,
      '직업': job,
      '흡연여부': smoking,
      '종교': religion,
      // '태그': tag,
      '사진': imageURL,
      '거리': distance,
      '거주지': address,
    };
  }
}
