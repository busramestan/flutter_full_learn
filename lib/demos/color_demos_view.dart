//bir ekran olucak
//bu ekranda 3 buton ve bunlara basınca renk değişimi olacak.
//secili olan button selected icon olsun

import 'dart:developer';

import 'package:flutter/material.dart';

class ColorsDemos extends StatefulWidget {
  const ColorsDemos({super.key, required this.initialColor});
  final Color? initialColor;

  @override
  State<ColorsDemos> createState() => _ColorsDemosState();
}

class _ColorsDemosState extends State<ColorsDemos> {
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorsDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    inspect(widget);

    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      //güncellemek gerektiği zaman setState kullanılıyor.
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: const [
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.red,
            ),
            label: 'Red'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow), label: 'yellow'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: 'Blue')
      ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

//Containerı extract widget olarak dışarı çıkardık ve burada dışarıdan parametre alarak colorı atadık.
class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10);
  }
}
