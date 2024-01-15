import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/101/image_learn.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});
  final _title = "Create your first note";
  final _description = "Add a note ";
  final _buttonText ="Create A Note" ;
  final _textButtonText ="Import Text";

  @override
  Widget build(BuildContext context) {
    
    //var _olduu = "Çokİyi bir Yerde Çalişiyorum WHO";
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar:AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().appleWithoutPath),
            _TitleWidget(title: _title),
             Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubtitleWidget(title: _description*10,),
            ),
            const Spacer(),
            _createButton(context),
            TextButton(onPressed: () {}, child: Text(_textButtonText)),
            const SizedBox(height: ButtonHeights.buttonNormalHeight,)
          ],
        ),
      ),
    );
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
            onPressed: () {}, 
            child:  SizedBox(
              height: ButtonHeights.buttonNormalHeight, child:  Center(child: Text(_buttonText,
              style: Theme.of(context).textTheme.bodyMedium,
              ))));
  }
}
/// Center text widget
class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    super.key,
    this.textAlign = TextAlign.center, required this.title
  });
  final TextAlign textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black,fontWeight: FontWeight.w400),
      );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title, //Text'i local variable yaptık
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black,
      fontWeight: FontWeight.bold,
      ),
      );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
  
}

class ButtonHeights {
  static const double buttonNormalHeight =50;
  
}
