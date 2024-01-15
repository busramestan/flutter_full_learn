import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            child:  Text('Save',style: Theme.of(context).textTheme.labelMedium,),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)
            ),
            onPressed: (){},
          ),

          ElevatedButton(onPressed: (){}, child: Text('data')),
          IconButton(onPressed: (){}, icon: Icon(Icons.abc_sharp)),
          FloatingActionButton(onPressed: (){},child: Icon(Icons.access_alarm),),
          OutlinedButton(onPressed: () {}, child: const Text('data'),),

          InkWell(
            onTap: (){},
            child: const Text('custom')),

            Container(
              height: 100,
              color: Colors.pink,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),),
              onPressed: (){}, 
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20, right: 40, left: 40),
                child: Text('Place Bid',style: Theme.of(context).textTheme.labelLarge,),
              ),
              
              ),

        ],
      ),
    );
  }
}