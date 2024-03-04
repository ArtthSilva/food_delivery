import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/models/recipe_model.dart';

class SelectedRecipe extends StatelessWidget {
  SelectedRecipe({ super.key, required this.recipe });
  RecipeModel recipe;

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: Text(recipe.name),),
           body: Container(),
       );
  }
}