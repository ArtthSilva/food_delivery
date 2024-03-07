import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/models/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRecipeController extends ChangeNotifier {
  List<RecipeModel> favorites = [];

    static final FavoriteRecipeController _singleton = FavoriteRecipeController._internal();

  factory FavoriteRecipeController() {
    return _singleton;
  }

  FavoriteRecipeController._internal();

  Future<void> addFavoriteRecipe(RecipeModel recipe) async {
    if (favorites.contains(recipe)) {
      favorites = List<RecipeModel>.from(favorites)..remove(recipe);
    } else {
      favorites = List<RecipeModel>.from(favorites)..add(recipe);
    }
    await saveFavoriteRecipes();
    notifyListeners();
  }

  Future<void> saveFavoriteRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesRecipes =
        favorites.map((recipe) => recipe.toJson()).toList();
    await prefs.setStringList('favoritesRecipes', favoritesRecipes);
    notifyListeners();
  }

  Future<void> loadFavoriteRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteRecipeJson =
        prefs.getStringList('favoritesRecipes') ?? [];
    favorites = favoriteRecipeJson
        .map((recipeJson) => RecipeModel.fromJson(recipeJson))
        .toList();
    notifyListeners();
  }

  bool verificar(RecipeModel model) {
    if (favorites.contains(model)) {
      return true;
    } else {
      return false;
    }
  }
}
