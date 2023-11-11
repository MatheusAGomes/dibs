import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MyPageIndexProvider with ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void updateIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void updatePc(int index, PageController pc) {
    _pageIndex = index;
    pc.jumpToPage(_pageIndex);
    notifyListeners();
  }
}
