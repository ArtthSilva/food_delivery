import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/controllers/favorite_recipe_controller.dart';
import 'package:food_delivery/src/modules/home/models/recipe_model.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SelectedRecipe extends StatefulWidget {
  SelectedRecipe({super.key, required this.recipe});
  RecipeModel recipe;

  @override
  State<SelectedRecipe> createState() => _SelectedRecipeState();
}

class _SelectedRecipeState extends State<SelectedRecipe> {
  FavoriteRecipeController controller = FavoriteRecipeController();
  @override
  void initState() {
    super.initState();
    controller.loadFavoriteRecipes();
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = controller.favorites
        .any((favoriteBook) => favoriteBook.id == widget.recipe.id);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              onPressed: () async {
                await controller.addFavoriteRecipe(widget.recipe);
                setState(() {});
              },
              icon: isFavorite
                  ? const Icon(Icons.favorite_outlined)
                  : const Icon(Icons.favorite_border),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.recipe.linkImage,
                          width: 250,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      widget.recipe.name,
                      style: GoogleFonts.balooTamma2(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.recipe.level,
                      style: GoogleFonts.balooTamma2(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: colorLevel(widget.recipe)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Descrição',
                        style: GoogleFonts.balooTamma2(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.recipe.description,
                style: GoogleFonts.balooTamma2(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Ingredientes',
                        style: GoogleFonts.balooTamma2(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                widget.recipe.ingredients,
                style: GoogleFonts.balooTamma2(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  colorLevel(RecipeModel recipe) {
    if (recipe.level == 'fácil') {
      return Colors.green;
    } else if (recipe.level == 'médio') {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
