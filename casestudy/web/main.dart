import 'dart:html';
import 'dart:core';
import 'mainActivity.dart';

void main() {
  NumberInputElement submit = querySelector('#submit') as NumberInputElement;
  List<int?> bookingtable = [];
  submit.onClick.listen((event) {
    Register myregister = Register(bookingtable);
    myregister.mainfunction();
    print(bookingtable);
  });
}

