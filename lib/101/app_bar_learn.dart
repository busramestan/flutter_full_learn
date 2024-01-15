import 'package:flutter/material.dart';


class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});
  final String _title='Welcome Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        actionsIconTheme: IconThemeData(color: Colors.white,size: 20),
        automaticallyImplyLeading: false, // sayfada otomatik olarak back butonu gelmsin demek 
        actions: [
          IconButton(onPressed: (){}, 
          icon: Icon(Icons.mark_email_read_outlined)
          ),
          Center(child: CircularProgressIndicator(color: Colors.white,))
          
          
          ],
      ),
    );
  }
}