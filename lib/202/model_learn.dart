// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PostModel1 {
  // variablelerin hespi null gelebilir. ? atarız.
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title,
      this.body); //constructor oluşumu yapıyrouz. Uygulama oluştuğunda gelicek demektir.
}

class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title,
      this.body); // bu variable'lar sadece constructor zamanında gelebilir. İnitialize olabilr. Öbür zamnada bu datalar gelemez
}

class PostModel4 {
  //named parametreler alır. Diğeriyle aynıdır sadece
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

class PostModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  int get userId => _userId;

  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class PostModel7 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({
    int userId = 0,
    int id = 0,
    String title = '',
    String body = '',
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class PostModel8 {
// eğer servisten bir data geliyorsa bunlar hep null gelebilir.
  final int? userId;
  final int? id;
  final String? title;
   String? body;

  PostModel8({this.userId, this.id, this.title, this.body});
  //nullable yapıldığında (int?) değerler 'required' istemezler.

  void updateBody(String? data) {
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
