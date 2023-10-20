import 'package:flutter/material.dart';

class RegisterContactPageViewController extends ChangeNotifier {
  int actualPage = 0;

  void nextPage() {
    if (actualPage == 2) {
      actualPage = 0;
    }

    actualPage++;
    notifyListeners();
  }

  void previousPage() {
    if (actualPage != 0) {
      actualPage--;
    }
    notifyListeners();
  }

  void onPageChanged(int index) {
    actualPage = index;
    notifyListeners();
  }
}
