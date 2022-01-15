import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier{
  List<String> _product=[];

  int get product_length=> _product.length;
  List<String> get product=> _product;

  void add_item(String name){
    _product.add(name);
    notifyListeners();
  }


  void delete_item(index){
    _product.removeAt(index);

    notifyListeners();
  }
}