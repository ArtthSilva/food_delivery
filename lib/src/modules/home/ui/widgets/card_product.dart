import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/models/recipe_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key, required this.recipe, required this.typeRecipe });
  final RecipeModel recipe;
  final String typeRecipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right:5),
      child: recipe.type == typeRecipe ? Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
               width: MediaQuery.sizeOf(context).width / 2,
               height: recipe.type == 'Drink' ? 270 : 210,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(recipe.linkImage)),
                  ),
 
                  Center(
                      child: Text(
                    recipe.name ,
                    style: GoogleFonts.balooTamma2(
                      fontWeight: FontWeight.w600,
                       fontSize: 16,
                    ),
                  )),
                  Center(
                      child: Text(
                    recipe.level,
                     style: GoogleFonts.balooTamma2(
                      fontWeight: FontWeight.w600,
                       fontSize: 16,
                       color: colorLevel(recipe)
                    ),
                  )),
 
                ],
              ),
            ),
          ),
          
        ],
      ) : Container(),
    );
  }

  colorLevel(RecipeModel recipe){
    if (recipe.level == 'fácil') {
      return Colors.green;
    } else if(recipe.level == 'médio'){
       return Colors.orange;
    } else{
      return Colors.red;
    }
  }
}
