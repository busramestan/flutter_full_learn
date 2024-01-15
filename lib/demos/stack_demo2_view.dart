import 'package:flutter/material.dart';
import 'package:flutter_learning/core/random_image.dart';

class StackDemo2View extends StatelessWidget {
  const StackDemo2View({super.key});
   final _cardHeight = 50.0;
   final _cardWidth = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        children: [
          Expanded(flex:4,child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(child: RandomImage(),bottom: _cardHeight/2,), //Imagenin bütün ekranı kaplmaası için positoned.fill yapıyoruz.
              Positioned(width:_cardWidth,bottom:0, height: _cardHeight,child: _customCard())
            ],
          )),
          const Spacer(flex: 6,)

        ],
      ),
    );
  }

  Card _customCard() => const Card(color: Colors.white,shape: RoundedRectangleBorder(),);
}