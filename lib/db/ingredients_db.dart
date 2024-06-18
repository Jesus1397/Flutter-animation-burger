import 'package:flutter/material.dart';
import 'package:flutter_animation_burger/models/ingredient_model.dart';

class IngredientsModel extends ChangeNotifier {
  final List<Ingredient> _ingredientsList = [
    Ingredient(
      name: '',
      image: 'assets/bread-bottom.png',
      selected: true,
    ),
    Ingredient(
      name: 'Bacon',
      image: 'assets/baccon.png',
      selected: true,
    ),
    Ingredient(
      name: 'Bacon',
      image: 'assets/meat.png',
      selected: true,
    ),
    Ingredient(
      name: 'Cheese',
      image: 'assets/cheddar.png',
      selected: true,
    ),
    Ingredient(
      name: 'Tomatoes',
      image: 'assets/tomato.png',
      selected: true,
    ),
    Ingredient(
      name: 'Salad',
      image: 'assets/letuce.png',
      selected: true,
    ),
    Ingredient(
      name: 'Onions',
      image: 'assets/onion.png',
      selected: true,
    ),
    Ingredient(
      name: '',
      image: 'assets/bread-top.png',
      selected: true,
    ),
  ];

  List<Ingredient> get ingredients => _ingredientsList;

  void toggleSelection(int index) {
    _ingredientsList[index].selected = !_ingredientsList[index].selected;
    notifyListeners();
  }
}
