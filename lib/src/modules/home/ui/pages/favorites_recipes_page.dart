import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/controllers/favorite_recipe_controller.dart';
import 'package:food_delivery/src/modules/home/ui/widgets/card_product.dart';

class FavoriteRecipesPage extends StatefulWidget {

 const FavoriteRecipesPage({super.key});

 @override
 FavoriteRecipesPageState createState() =>  FavoriteRecipesPageState();
}

class FavoriteRecipesPageState extends State<FavoriteRecipesPage> {
     FavoriteRecipeController favoriteController = FavoriteRecipeController();

     @override
  void initState() {
    super.initState();
    favoriteController.addListener(() {
      setState(() {});
    });
    favoriteController.loadFavoriteRecipes();
  }

  @override
  void dispose() {
    favoriteController.loadFavoriteRecipes();
    super.dispose();
  }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Receitas Favoritas'),
      ),
      body:   favoriteController.favorites.isEmpty
          ? const Center(
              child: Text("Nenhuma receita adicionada como favorita"),
            )        
          : GridView.builder(
            gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
              
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.41),
                  
                  ),
            itemCount: favoriteController.favorites.length,
             itemBuilder: (context, index) {
                
                  final recipe = favoriteController.favorites[index];
                 return CardProduct(recipe: recipe, typeRecipe: recipe.type);
               })
    );
 }
}
