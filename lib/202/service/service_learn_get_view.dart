import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/202/model_learn.dart';
import 'package:flutter_learning/202/service/comments_learn_view.dart';
import 'package:flutter_learning/202/service/post_model.dart';

import 'post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  // burada listeyi _items olarak tanımaladık.
  // şu anda bir data olmadığı için boş olabilir o yüzden nullable diyoruz.

  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  //Test Edilebilir kod başladı.

  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    // proje başlamadan önce çağırmak için  burada kullanıyoruz.
    _postService = PostService();
    name = 'Büşra';
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    // Future döner o yüzden asekron bir cevap döner
    final response = await Dio().get('https://jsonplaceholder.typicode.com/'); // get requestidir.

    // bu kodu bekle bu koddan sonra buraya geçme demek.

    if (response.statusCode == HttpStatus.ok) {
      // bu işlem başarılı mı diye bakıyoruz.
      //Status kodunu kontrol ediyoruz.
      final _datas = response.data;

      if (_datas is List) {
        // Buradaki listeyi yrni bir liste haline dönüştüryoruz
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        }); // setState diyerek ekranda güncelliyoruz.
      }
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    // Future döner o yüzden asekron bir cevap döner
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0, //length null'sa aslında sıfırdır
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              }),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommentsLearnView(
                    postId: _model?.id,
                  )));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
