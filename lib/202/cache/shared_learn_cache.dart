import 'package:flutter/material.dart';
import 'package:flutter_learning/202/cache/shared_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final List<User> userItems;

  late final SharedManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();

    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    //final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getStrings(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value); // burada parse edilirse value null değildir.
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_currentValue.toString())),
        actions: [
          _isLoading(context)
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            
            onChanged: (value) {
              _onChangeValue(value);
            },
            decoration: const InputDecoration(hintText: 'Sayı giriniz !'),
          ),
          Expanded(
            child: _UserListView(),
          )
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _isLoading(BuildContext context) {
    return isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).hintColor,
              ))
            : const SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);

        changeLoading();
      },
      child: const Icon(Icons.remove),
    );
  }
}

class _UserListView extends StatelessWidget {
   _UserListView({
    super.key,
  });
  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(users[index].name),
              subtitle: Text(users[index].description),
              trailing: Text(users[index].url,style: const TextStyle(decoration: TextDecoration.underline),),
            
            ),
          );
        });
  }
}

class User {
  final String name;
  final String description;
  final String url;

  User(this.name, this.description, this.url);
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('Bm', 'computer engineer', 'bm7.dev'),
      User('Bm2', 'computer engineer2', 'bm7.dev'),
      User('Bm3', 'computer engineer3', 'bm7.dev'),
    ];
  }
}

//Genereic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  //fonksiyonları üst classta yazarken burada abstract class oluşturup burada yazıcaz
  // bu sınıfın adını da yukarıya entegre ettik.
  // burayada oradaki fonksiyonlarımızı yazıyoruz.
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
