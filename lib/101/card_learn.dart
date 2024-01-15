import 'package:flutter/material.dart';

class CardLeran extends StatelessWidget {
  const CardLeran({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  Column(
        children: [
          Card(
            margin: ProjectMargins.cardMargin,
            color: Theme.of(context).colorScheme.error,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child:  const SizedBox(
              height: 100,
              width: 300,
              child: Center(
                child: 
                Text('Büşra'),
                ),
                ),
          ),
          Card(
            margin: ProjectMargins.cardMargin,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const SizedBox(
              height: 100,
              width: 300,
              child: Center(
                child: Text('Mestan'),
              ),
              ),
          ),
           _CustomCard(
            child:  const SizedBox(
              height: 100,
              width: 300,
              child: Center(
                child: Text('Mestan'),
              ),
              ),)

        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
  static final rountedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  
}
 


//Borders
//StadiumBorder(), Circularborder(), RountedRegtangleBorder(),


class _CustomCard extends StatelessWidget{

   _CustomCard({super.key, required this.child});
  final Widget child;
  final  rountedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
   
   return Card(
            margin: ProjectMargins.cardMargin,
            shape: rountedRectangleBorder,
            child: child,
          );
  }
  
}