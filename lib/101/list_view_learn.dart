import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
         children: [
           FittedBox(
             child: Text('Merhaba',
             style: Theme.of(context).textTheme.headline1,
             maxLines: 1,
             ),
           ),
          
           Container(color: Colors.red,height: 300,),
          
           const Divider(),
          
           SizedBox(height: 400,
             child: ListView(scrollDirection: Axis.horizontal , children:[
              Container(color: Colors.green,width: 100,),
              Container(color: Colors.white,width: 100,),
              Container(color: Colors.green,width: 100,),
              Container(color: Colors.white,width: 100,),
              Container(color: Colors.green,width: 100,),
              Container(color: Colors.white,width: 100,),
           
             ] ),
           ),
          
           IconButton(onPressed: (){}, icon: Icon(Icons.close)),
           const ListViewDemos(),
          
         ],
       ),

    );
  }
}


class ListViewDemos extends StatefulWidget {
  const ListViewDemos({super.key});

  @override
  State<ListViewDemos> createState() => _ListViewDemosState();
}

class _ListViewDemosState extends State<ListViewDemos> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}