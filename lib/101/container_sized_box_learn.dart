import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});
  //ekran çizimi yapmak istersek statelessWidgetle sarmalıyoruz.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text('a' * 500),
          ),
          SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),
          Container(
            child: Text('aa' * 1),
            height: 50,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            constraints: const BoxConstraints(
              maxWidth: 150,
              minWidth: 100,
              maxHeight: 100,
            ),
            decoration: ProjectUtility.boxDecoration,
          )
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(colors: [Colors.red, Colors.yellow]),
    boxShadow: const [
      BoxShadow(color: Colors.pink, offset: Offset(0.1, 1), blurRadius: 5.5)
    ],
    border: Border.all(width: 10, color: Colors.white12),
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [Colors.red, Colors.yellow]),
          boxShadow: const [
            BoxShadow(
                color: Colors.pink, offset: Offset(0.1, 1), blurRadius: 5.5)
          ],
          border: Border.all(width: 10, color: Colors.white12),
        );
}
