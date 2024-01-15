import 'package:flutter/material.dart';
import 'package:flutter_learning/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'Büşra Mestan');
  @override
  void initState() {
    super.initState();

    final user1 = PostModel1();
    user1.body = 'hello';
    user1.title = ' Busra';

    final user2 = PostModel2(1, 2, 'a', 'b');
    user2.title = 'busra';
    // burada yine böyle atama yapabilriz. Çünkü PostModel2 de variableler final olarak işaretlenmemiştir.
    //sonradan değerler alabiliyor ve update edilebiliyor.

    final user3 = PostModel3(2, 3, 'busra mestan', 'Expert Developer Computer Engineer');

    //user3.body = 'Mestann'; // buradaki(PostModel3) değişkenler final olarak tanımlandığı için böyle bir atama yapamazsın update edemezsin diye hata veriyor.

    final user4 = PostModel4(userId: 1, id: 2, title: 'a', body: 'b');
    //user4.body = 'c'; burada named olarak geliyor ve  neyin ne olduğu belli oluyor. Yine değişkkeni mupdate edemeyiz final olarak tanımlandığı için.

    final user5 = PostModel5(userId: 1, id: 2, title: 'busra', body: 'Expert Developer Computer Engineer');
    user5.userId; // burada Postmodel5 e koşul yazıdğımız için userId ye ulaşabildik.

    final user6 = PostModel6(userId: 1, id: 2, title: 'busra', body: 'Expert Developer Computer Engineer');
    //user6. böyle yaparak variablelere erişemeyiz çünkü değişkenler private olarak atanmıştır.

    final user7 = PostModel7();

    //Servisten data çekiliyorsa en mantıklı yöntem budur.
    final user8 = PostModel8(
      body: 'Expert Developer Computer Engineer Büşra Mestan',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          // ekranda güncellemek istiyorsak da setState içinde işlemleri yapıyoruz.
          user9 = user9.copyWith(title: 'Bm');
          user9.updateBody(null);
        });
      }),
      appBar: AppBar(
        title: Text(user9.title ?? 'Not has any data'),
      ),
    );
  }
}
