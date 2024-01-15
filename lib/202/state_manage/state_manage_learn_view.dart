import 'package:flutter/material.dart';
import 'package:flutter_learning/202/state_manage/state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.blue,
        shadowColor: isVisible ? Colors.amber : Colors.pink,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeVisible();
      }),
    );
  }
}
