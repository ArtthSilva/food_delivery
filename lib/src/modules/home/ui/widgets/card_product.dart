 
import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/models/recipe_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProduct extends StatefulWidget {
  const CardProduct(
      {super.key, required this.recipe, required this.typeRecipe});
  final RecipeModel recipe;
  final String typeRecipe;

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 5),
      child: widget.recipe.type == widget.typeRecipe
          ? Stack(            
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 2,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        const SizedBox(
                         height: 100,
                         ),
                        Center(
                            child: Text(
                          widget.recipe.name,
                          style: GoogleFonts.balooTamma2(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        )),
                        Center(
                            child: Text(
                          widget.recipe.level,
                          style: GoogleFonts.balooTamma2(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: colorLevel(widget.recipe)),
                        )),
                      ],
                    ),
                  ),
                ),
                                Positioned(
                 top: 40,
                 right: 40,
                 left: 40,
                 child: Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CircleAvatar(
                      radius: 44,
                      backgroundImage:
                          NetworkImage(widget.recipe.linkImage),
                    ),
                 ),
                ),
              ],
            )
          : Container(),
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
