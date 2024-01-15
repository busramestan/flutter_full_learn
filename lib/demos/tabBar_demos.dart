import 'package:flutter/material.dart';
import 'package:flutter_learning/101/icon_learn.dart';
import 'package:flutter_learning/101/image_learn.dart';

class TabbarDemo extends StatefulWidget {
  const TabbarDemo({super.key});

  @override
  State<TabbarDemo> createState() => _TabbarDemoState();
}

class _TabbarDemoState extends State<TabbarDemo> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true, // floatingActionButoonun ark planda görünmesi için ture yapıyoruz.
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue, //butonun arka planda ne kadar kenarlarından ayrıldığı
            //shape: const CircularNotchedRectangle(), // köşeli yuvarlak yapıyorç
            child: _myTabView(),
          ),
          body: _tabBarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: '${e.name}',
                ))
            .toList());
  }

  TabBarView _tabBarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(), // sayfadan scrool olarak diğer sayfaya geçme
        controller: _tabController,
        children: [
          const ImageLearn(),
          IconLearnView(),
          const ImageLearn(),
          IconLearnView(),
        ]);
  }
}

enum _MyTabViews {
  home,
  settings,
  favorite,
  profile,
}

//Extension enum olan _MyTabViews a güç katmak için yazılıyor.

extension _MyTabViewExtension on _MyTabViews {}
