//bir view var,viewla iş yapan katmanlarınız olucak (modelleriniz) 
//ve bu iki katman arasını yöneten ara katmamn olarak düşünebilir.

import 'package:flutter/material.dart';

import 'state_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  
  bool isVisible = false;
  bool isOpacity = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }

}