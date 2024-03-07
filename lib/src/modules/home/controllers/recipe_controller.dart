
import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/models/recipe_model.dart';
 import 'package:food_delivery/src/modules/home/repositories/recipe_repository.dart';

class RecipeController{
  final ValueNotifier<bool>isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<List<RecipeModel>> state = ValueNotifier<List<RecipeModel>>([]);
  final  RecipeRepository repository;

  RecipeController({required this.repository});
   

  Future loadRecipes() async{
    isLoading.value = true;
    try {
      final result =  await repository.getRecipes();
     state.value = result;
    } catch (e) {
      print(e.toString());
    }
    isLoading.value = false;
  }
}