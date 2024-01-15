import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'comment_model.dart';
import 'post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  late final Dio _dio;

  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _dio.post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id', data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id');

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    // Future döner o yüzden asekron bir cevap döner
    try {
      final response = await _dio.get(_PostServicePaths.posts.name); // get requestidir.

      // bu kodu bekle bu koddan sonra buraya geçme demek.

      if (response.statusCode == HttpStatus.ok) {
        // bu işlem başarılı mı diye bakıyoruz.
        //Status kodunu kontrol ediyoruz.
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response =
          await _dio.get(_PostServicePaths.commnets.name, queryParameters: {_PostQueryPaths.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (excepiton) {
      _ShowDebug.showDioError(excepiton, this);
    }
    return null;
  }
}

enum _PostServicePaths { posts, commnets }

enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioException error, T typpe) {
    if (kDebugMode) {
      print(error.message);
      print(typpe);
      print('-------');
    }
  }
}
