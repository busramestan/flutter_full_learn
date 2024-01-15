import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn({super.key});

  @override
  State<NavigateDetailLearn> createState() => _NavigateDetailLearnState();
}

class _NavigateDetailLearnState extends State<NavigateDetailLearn> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ModalRoute.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: Icon(Icons.done),
            label: Text('Onayla')),
      ),
    );
  }
}
