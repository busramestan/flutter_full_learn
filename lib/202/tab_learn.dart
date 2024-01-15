import 'package:flutter/material.dart';
import 'package:flutter_learning/101/card_learn.dart';
import 'package:flutter_learning/101/icon_learn.dart';
import 'package:flutter_learning/101/image_learn.dart';
import 'package:flutter_learning/101/text_field_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabVievs.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TabBar kullanmak için return e DefaultTabController'la başlıyoruz.
    return DefaultTabController(
        length: _MyTabVievs.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabVievs.home.index);
          }),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 10,
            child: _myTabBar(),
          ),
          appBar: AppBar(),
          body: _myTabBarView(),
        ));
  }

  TabBar _myTabBar() {
    return TabBar(
              onTap: (int index) {},
              controller: _tabController,
              tabs: _MyTabVievs.values
                  .map((e) => Tab(
                        text: '${e.name}',
                      ))
                  .toList());
  }

  TabBarView _myTabBarView() {
    return TabBarView(controller: _tabController, children: [
          const ImageLearn(),
          const TextFieldLearn(),
          const CardLeran(),
          IconLearnView(),
        ]);
  }
}

enum _MyTabVievs { home, settings, favorite, profil }

extension _MyTabViewsExtensions on _MyTabVievs {}
