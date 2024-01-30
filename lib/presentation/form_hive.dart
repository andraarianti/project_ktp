import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class SaveForm extends ChangeNotifier{
  static const _myBox = 'form_data';

  SaveForm() {
    _init();
  }

  Future<void> _init() async {
    await Hive.initFlutter();
    var box = await Hive.openBox(_myBox);
    notifyListeners();
  }
}