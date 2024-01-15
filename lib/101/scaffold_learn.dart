import 'package:flutter/material.dart';
import 'package:flutter_learning/101/container_sized_box_learn.dart';

class ScaffoldLaernView extends StatelessWidget {
  const ScaffoldLaernView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold Samples'),
      ),
      drawer: const Drawer(),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 200,
            ),
          );
        },
      ),
      bottomSheet: const Text('Busra Mestan'),
      body: const Text('merhaba'),
      bottomNavigationBar: Container(
        height: 300,
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.abc_outlined), label: 'etiket'),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc_outlined), label: 'etiket22'),
        ]),
      ),
    );
  }
}
