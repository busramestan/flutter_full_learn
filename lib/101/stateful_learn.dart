import 'package:flutter/material.dart';

import '../product/counter_hello_button.dart';
import '../product/language/language_items.dart';

class StatefulLearn extends StatefulWidget {
  const StatefulLearn({super.key});
  //Burası stateles gibi çalışır ,sadece dışarıdan data alır.Değşmez bir classtır

  @override
  State<StatefulLearn> createState() => _StatefulLearnState();
}

class _StatefulLearnState extends State<StatefulLearn> { //state hayatı belirleyen kısımdır.Burada değişklikler olur,burada kodlar gelişir.
  int _countValue =0;
  int _counterCustom= 0;


  /*void incrementValue() {
   setState(() {
      _countValue = _countValue + 1 ;
   });
  }
  void deincrementValue() {
    setState(() {
       _countValue = _countValue - 1 ;
    });
  }
  */ //Aşağıdaki fonksİyonu yazarak ayrı iki tane fonksiyon oluşturmaya gerek kalmaz.

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
       _countValue = _countValue + 1 ;
    }else{
      _countValue = _countValue - 1 ;
    }
    setState(() {
      
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(LanguageItems.welcomeTitle),),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
        

      body:  Column(
        children: [
          Center(child: Text(_countValue.toString(),style: Theme.of(context).textTheme.headlineMedium,)),
          const Placeholder(),
          const CounterHelloButton()

          


        ],
      ),

    );
  }

  Padding _deincrementButton() {
    return Padding(
          padding: const EdgeInsets.only(left:10),
          child: FloatingActionButton(
            onPressed: () {
              _updateCounter(false);
            },
            child: const Icon(Icons.remove),),
        );
  }

  FloatingActionButton _incrementButton() {
    print('burda');
    return FloatingActionButton(
          onPressed: () {
            _updateCounter(true);
            },
          child: const Icon(Icons.add),
          );
  }

  

  
}