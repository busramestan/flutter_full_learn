import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/202/animated_learn.dart';
import 'package:flutter_learning/202/cache/shared_learn_cache.dart';
import 'package:flutter_learning/202/form_learn_view.dart';
import 'package:flutter_learning/202/image_learn_202.dart';
import 'package:flutter_learning/202/oop_learn_view.dart';
import 'package:flutter_learning/202/theme/light_theme.dart';
import 'package:flutter_learning/202/theme_learn_view.dart';
import '202/model_learn_view.dart';
import '202/package_learn_view.dart';
import '202/service/service_post_learn_view.dart';
import '202/service/service_learn_get_view.dart';
import '202/tab_learn.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Material App',
      theme: LightTheme().theme,
     /* theme: ThemeData.dark().copyWith(
        bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          indicatorColor: Colors.green,
          unselectedLabelColor: Colors.blueGrey,
          indicatorSize: TabBarIndicatorSize.label
        ),
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0, 
          systemOverlayStyle: SystemUiOverlayStyle.light, //telefonun en üsütnd eyre alan saat ve ikonların renkv  ayarı
          )
      ),*/
      debugShowCheckedModeBanner: false,
      home: const SharedLearn(),
    );
  }
}
