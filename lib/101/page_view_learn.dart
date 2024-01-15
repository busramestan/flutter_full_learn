import 'package:flutter/material.dart';
import 'package:flutter_learning/101/card_learn.dart';
import 'package:flutter_learning/101/icon_learn.dart';
import 'package:flutter_learning/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController  =PageController();

  int _currentPageIndex  = 0;

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex  = index;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        
        children:  [
          Padding(
            padding:  const EdgeInsets.only(left: 20),
            child:  Text(_currentPageIndex.toString()),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: (){
              _pageController.previousPage(duration: _DurationUtility._durationLow, curve: _CurveUtiliy._slowMiddle);
            },
            child: const Icon(Icons.chevron_left),
            ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: FloatingActionButton(
              onPressed: (){
                _pageController.nextPage(duration: _DurationUtility._durationLow, curve: _CurveUtiliy._slowMiddle);
              },
              child: const Icon(Icons.chevron_right),
              ),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false,
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children:  [
          IconLearnView(),
          const StackLearn(),
          const CardLeran(),
        ],
      ),
    );
  }
}

class _DurationUtility {

  static const _durationLow  =Duration(seconds: 1);
  
}

class _CurveUtiliy {
  static const _slowMiddle  =Curves.slowMiddle;
  
}