import 'package:flutter/material.dart';

class StatefulLifeCycleLearn extends StatefulWidget {
  const StatefulLifeCycleLearn({super.key, required this.message});

  final String message;

  @override
  State<StatefulLifeCycleLearn> createState() => _StatefulLifeCycleLearnState();
}

class _StatefulLifeCycleLearnState extends State<StatefulLifeCycleLearn> {
  String _message = "";
  late final bool _isOdd; //constructor anında değerini alacak dediğimiz için late yazıyoruz.

  @override
  void didChangeDependencies() {
    //initStateden sonra çalışır. yine Drawdan önce çalışır ama initState bundan önce çalışır.
    super.didChangeDependencies();
    print('c');
  }

  @override
  void didUpdateWidget(covariant StatefulLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("b");
  }

  @override
  void dispose() { //çıkılan sayfayı öldürüyor.
    super.dispose();
    _message = "";
  }

  //Mesaj tekse yanina tek çiftse yanına çift yaz.
  @override //initStateden sonra ekran çizilmeye başlanır.
  //initState metodları bir kere yazılır. İkinciye yazılmaz.
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd =
        widget.message.length.isOdd; //initState daha ekran çizilmeden bu işini alacak ve değğerini sabitlemiş olacak.
    _computeName();
    print("a");
  }

  void _computeName() {
    //Burası asla initState içiçnde açık açık yazılmaz. Extract metod olarak yazdık.
    if (_isOdd) {
      _message += " Çİft";
    } else {
      _message += " Tek";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message), //tek ise isOdd komutunu kullanarak kontrol ediyoruz.
      ),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
