import 'package:flutter/material.dart';


// Burası Anasayfam olduğu için _ColorsUtility i burada değil ihtiyacımolan classda kullanırım.
class CustomWidgetLearn extends StatelessWidget {
   const CustomWidgetLearn({Key? key}) : super(key: key);
   final String title ="Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Padding( //Butonun soldan ve sağdan olma durumunu componentin yapmamsı lazım.
                                 //Buradan olması gerekiyor.
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(width:MediaQuery.of(context).size.width, child: CustomFoodButton(title: title, onPressed: () {  },)),
          )),
          const SizedBox(height: 100,),

          CustomFoodButton(title: title, onPressed: () { },),
        ],
      ),
    );
  }
}

mixin _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
  
}

mixin _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
  
}

class CustomFoodButton extends StatelessWidget with _ColorsUtility, _PaddingUtility{
   CustomFoodButton({super.key, required this.title, required this.onPressed});
   final String title ;
   final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: redColor,shape: const StadiumBorder()),
          onPressed: onPressed, 
          child: Padding(
            padding: normal2xPadding,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color:whiteColor,fontWeight: FontWeight.bold),
              ),
          ));
  }
}