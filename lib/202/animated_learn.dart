import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: _DurationItems.durationLow);
  }
  late AnimationController controller;
  bool _isVisible = false;
  bool _isOpacity = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _placeHolderWidget(),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          controller.animateTo(_isVisible ? 1 : 0);
          _changeVisible();
        }),
        body: Column(
          children: [
            ListTile(
              title: AnimatedOpacity(
                  opacity: _isOpacity ? 1 : 0, duration: _DurationItems.durationLow, child: const Text('data')),
              trailing: IconButton(
                  onPressed: () {
                    _changeOpacity();
                  },
                  icon: const Icon(Icons.precision_manufacturing_rounded)),
            ),
            AnimatedDefaultTextStyle(
                child: const Text('data'),
                style: (_isVisible ? context.textTheme().headlineLarge : context.textTheme().bodyLarge) ?? TextStyle(),
                duration: _DurationItems.durationLow),
            AnimatedIcon(
              icon: AnimatedIcons.view_list,
              progress: controller,
            ),
            AnimatedContainer(duration: _DurationItems.durationLow,
            height: _isVisible ? 0 : (MediaQuery.of(context).size.width)* 0.2,
            width: (MediaQuery.of(context).size.height)*0.2,
            color: Colors.blue,
            margin: EdgeInsets.all(20),
            ),
            const Expanded(child: Stack(
              children: [
                AnimatedPositioned(top: 10,curve: Curves.elasticInOut, child: Text('data'), duration: _DurationItems.durationLow)
              ],
            ))
          ],
        ));
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
        firstChild: const Placeholder(),
        secondChild: const SizedBox(),
        crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _DurationItems.durationLow);
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
