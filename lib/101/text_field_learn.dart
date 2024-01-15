import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          children: [
            TextField(
              maxLength: 20,
              buildCounter: (BuildContext context,
                  {required int currentLength, required bool isFocused, required int? maxLength}) {
                return _animatedContainer(currentLength);
              },
              keyboardType: TextInputType.emailAddress,//klavye mail tipinde açılıyor
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail), //Sola ikon koymak için prefixIcon
                border: OutlineInputBorder(), //kutu şeklinde göstermek için
                //hintText: 'Mail',//kutunun iççinde yazoyor
                labelText: 'Mail', //kutunun üst kısmına etiket olarak geliyor.
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer(int currentLength) {
    return AnimatedContainer(
          key: key,
          duration: const Duration(milliseconds: 1),
          color: Colors.amber[100 * ((currentLength ?? 0) ~/ 2)],
          width: 10.0 * (currentLength ?? 0),
          height: 20,
        );
  }
}
