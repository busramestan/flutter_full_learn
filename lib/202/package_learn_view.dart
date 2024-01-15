import 'package:flutter/material.dart';
import 'package:flutter_learning/202/package/launch_manager.dart';
import 'package:flutter_learning/202/package/loading_bar.dart';
import 'package:flutter_learning/demos/password_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> {
  
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onSecondary,
        onPressed: () {
        //launchUrl("x");
      }),
      body: Column(
        children: [
          Text('a',style: Theme.of(context).textTheme.bodyMedium),
          const LoadingBar(
          size: null,
          ),
        ],
      ),
    );
  }


}

