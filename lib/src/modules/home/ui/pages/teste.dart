import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/controllers/favorite_recipe_controller.dart';
import 'package:food_delivery/src/modules/home/models/recipe_model.dart';

class FavoritesScreen extends StatefulWidget {
 @override
 _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
 FavoriteRecipeController controller = FavoriteRecipeController();
 List<RecipeModel> favorites = [];

 @override
 void initState() {
    super.initState();
    loadFavorites();
 }

 void loadFavorites() async {
    controller.loadFavoriteRecipes();
    setState(() {});
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favorites[index].name),
            // Aqui você pode adicionar mais detalhes ou ações para cada receita
          );
        },
      ),
    );
 }
}
