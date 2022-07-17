
import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier{
  final List<int> _favoriteitems =[];

  List<int> get items => _favoriteitems;

  void add(int itemNo){
    _favoriteitems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo){
    _favoriteitems.remove(itemNo);
    notifyListeners();
  }
}