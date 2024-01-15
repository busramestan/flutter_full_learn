import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
   IconLearnView({super.key});
  final IconSizes iconSize = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Hello'),),
      body:  Column(
        children: [
          IconButton(onPressed: (){}, 
          icon:  Icon(
            Icons.message_outlined,
            color: iconColors.persianBlue,
            size: IconSizes.iconSmal2x,
            )),

        const SizedBox(height: 50,),

        IconButton(onPressed: (){}, 
          icon: Icon(
            Icons.message_outlined,
            color: iconColors.persianBlue,
            size: iconSize.iconSmal,
            )),
        IconButton(onPressed: (){}, 
          icon: Icon(
            Icons.message_outlined,
            color:iconColors.persianBlue,
            size: iconSize.iconSmal,
            )),  
        ],
      ),
    );
  }
}

class IconSizes {

  final double iconSmal = 40;
  static const double iconSmal2x = 80;
  
}

class IconColors {
  final Color persianBlue= const Color(0xff1535C6);
  
}