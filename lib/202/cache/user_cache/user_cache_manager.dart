import 'dart:convert';

import 'package:flutter_learning/202/cache/shared_manager.dart';

import '../shared_learn_cache.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  void saveItems(List<User> items) {
    final _items = items.map((element) => jsonEncode(element)).toList();
    sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemsString = sharedManager.getStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final jsonObject = jsonDecode(element);
        return User('name', 'description', 'url');
      }).toList();
    }
    return null;
  }
}
