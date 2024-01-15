import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget{
  final String text2 = 'busra';
  @override
  Widget build(BuildContext context) {
   
   return Scaffold(
    appBar: AppBar(),
    body:   Column(
      children: [
         TitleTextWidget(text: text2),
        const TitleTextWidget(text: 'busra1'),
        const TitleTextWidget(text: 'busra11'),
        const TitleTextWidget(text: 'busra111'),

        const _CustomContainer(),

        _emptyBox(),
   
      ],
    ),
   );
  }

  SizedBox _emptyBox() => const SizedBox(height: 10,);

  
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,

      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key , required this.text}) :super(key : key) ;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
        );
  }
}
