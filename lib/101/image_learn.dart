import 'package:flutter/material.dart';


class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});
  final String _imagePath= "https://www.shareicon.net/data/2016/09/01/822957_apple_512x512.png"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
          height: 400,
          width: 400,
          child: PngImage(name: ImageItems().appleWithoutPath),
          ),
          Image.network("https://www.shareicon.net/data/2016/09/01/822957_apple_512x512.png",
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          )
      ],),
    );
  }
}


class ImageItems {
  final String appleWithBook = "assets/book.png";
  final String appleWithoutPath ="book";
  
}


class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath,fit: BoxFit.contain,);
  }

  String get _nameWithPath => "assets/$name.png";
}
