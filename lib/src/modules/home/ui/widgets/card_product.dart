import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/models/recipe_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key, required this.recipe, });
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15,right:5),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
               width: MediaQuery.sizeOf(context).width / 2,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(recipe.linkImage)),
                  const SizedBox(
                    height: 20,
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
                    recipe.level  ,
                     
                  )),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
