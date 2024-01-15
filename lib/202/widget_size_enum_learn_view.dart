import 'package:flutter/material.dart';

class WidgetSizeEnum extends StatefulWidget {
  const WidgetSizeEnum({super.key});

  @override
  State<WidgetSizeEnum> createState() => _WidgetSizeEnumState();
}

class _WidgetSizeEnumState extends State<WidgetSizeEnum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(height: WidgetSizes.normalCardHight.value(), color: Colors.red),
      ),
    );
  }
}

enum WidgetSizes {normalCardHight,circleProfileWidth,}

extension WidgetSizeExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHight:
        return 30;
      case WidgetSizes.circleProfileWidth:
        return 25;
    }
  }
}
