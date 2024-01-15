import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
   const TextLearnView({Key? key, this.userName}) : super(key: key);
   final String name="Büşra";

   final String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ("Welcome $name ${name.length}"),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  wordSpacing: 2,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                  color: Colors.amber,
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
                  ),

               Text(
                ("Welcome $name ${name.length}"),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.yellow),
                  ),

                  Text(userName ?? "")
            ],
          )),
      );
       
   }
}
class ProjectStyles {
 static TextStyle welcomeStyle = const TextStyle(
                  wordSpacing: 2,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                  color: Colors.amber,
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600);
              
 //style için sınıf tanımyalayıp ösellikleri diğer textlerde classname. degiskenadı olarak kullanılabilir.
}