import 'package:flutter/foundation.dart';
class FavoruteProvider extends ChangeNotifier{
  List _selectItem=[];
  List get selectItem=>_selectItem;

  void addItem(int value)
  {
    _selectItem.add(value);
  }
  void removeItem(int value)
  {
    _selectItem.remove(value);
    notifyListeners();
  }
}