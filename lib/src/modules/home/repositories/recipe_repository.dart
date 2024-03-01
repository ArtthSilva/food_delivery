
  import 'package:food_delivery/src/modules/home/models/recipe_model.dart';

abstract class RecipeRepository {
  Future <List<RecipeModel>> getRecipes();
} 