import 'package:flutter/material.dart';
import 'package:flutter_learning/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  //Projede atomik bir componentse paddingleri ben veririm.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const RandomImage(),
                //contentPadding: EdgeInsets.zero, bu kodu temadan verdim.
                onTap: () {},
                subtitle: const Text("How do you use your card"),
                leading: Container(height: 100,color: Colors.red,child: const Icon(Icons.money)), //sola ekleme yaparken kullanılan
                trailing: const SizedBox(
                  width: 20,
                  child: Icon(Icons.chevron_right)),// Sağ tarafa ekleme yapılırken 
              ),
            ),
          )
      
          
        ]),
      ),
    );
  }
}