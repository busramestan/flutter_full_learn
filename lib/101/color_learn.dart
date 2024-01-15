import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: ColorsItems.perfume,
            child: const Text('data'),
          ),
          Container(
            color: ColorsItems.perfume,
            child: const Text('data'),
          ),
        ],
      ),
    );
  }
}

class ColorsItems {
  static const Color java = Color(0xff15C6BA);
  static const Color perfume = Color.fromRGBO(212, 136, 242, 1);
}
