 
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery/src/modules/home/controllers/favorite_recipe_controller.dart';
import 'package:food_delivery/src/modules/home/controllers/recipe_controller.dart';
import 'package:food_delivery/src/modules/home/models/recipe_model.dart';
import 'package:food_delivery/src/modules/home/repositories/recipe_repository_imp.dart';
import 'package:food_delivery/src/modules/home/ui/pages/selected_recipe.dart';
import 'package:food_delivery/src/modules/home/ui/widgets/card_product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  RecipeController controller = RecipeController(
    repository: RecipeRepositoryImp(
      client: HttpClient(),
    ),
  );
   @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    controller.loadRecipes();
         

    super.initState();
  }

  chosenRecipe(RecipeModel recipe) {
      Navigator.push(
        context,
        PageTransition(child:SelectedRecipe(recipe: recipe),
         type: PageTransitionType.rightToLeftWithFade,         
         duration: const Duration(milliseconds: 350))
      );
  }
  FavoriteRecipeController controllers = FavoriteRecipeController();
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Align(
                    alignment: const Alignment(-0.75, 1),
                    child: InkWell(
                      child: Image.asset('assets/images/menu_icon.png'),
                      onTap: () => ZoomDrawer.of(context)!.toggle(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 33),
                      Text(
                        'Receitinhas \npara você',
                        style: GoogleFonts.balooTamma2(
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 15, bottom: 45),
                    child: SearchBar(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey[100]),
                      leading: const Icon(Icons.search),
                      hintText: 'Pesquisar',
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: TabBar(
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          controller: tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor:
                              const Color.fromARGB(234, 255, 84, 68),
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'Salgadas',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12.0, bottom: 5),
                              child: Text(
                                'Doces',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12.0, bottom: 5),
                              child: Text(
                                'Drinks',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.43,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            AnimatedBuilder(
                                animation: Listenable.merge(
                                    [controller.isLoading, controller.state]),
                                builder: (context, child) {
                                  if (controller.isLoading == true) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            controller.state.value.length,
                                        itemBuilder: (_, index) {
                                          final recipe =
                                              controller.state.value[index];

                                          return ValueListenableBuilder<
                                                  List<RecipeModel>>(
                                              valueListenable: controller.state,
                                              builder: (context, value, child) {
                                                return InkWell(
                                                  onTap: () =>
                                                      chosenRecipe(recipe),
                                                  child: CardProduct(
                                                    recipe: recipe,
                                                    typeRecipe: 'Salgada',
                                                  ),
                                                );
                                              });
                                        });
                                  }
                                }),
                            AnimatedBuilder(
                                animation: Listenable.merge(
                                    [controller.isLoading, controller.state]),
                                builder: (context, child) {
                                  if (controller.isLoading == true) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            controller.state.value.length,
                                        itemBuilder: (_, index) {
                                          final recipe =
                                              controller.state.value[index];

                                          return ValueListenableBuilder<
                                                  List<RecipeModel>>(
                                              valueListenable: controller.state,
                                              builder: (context, value, child) {
                                                return InkWell(
                                                  onTap: () =>
                                                      chosenRecipe(recipe),
                                                  child: CardProduct(
                                                    recipe: recipe,
                                                    typeRecipe: 'Doce',
                                                  ),
                                                );
                                              });
                                        });
                                  }
                                }),
                            AnimatedBuilder(
                              animation: Listenable.merge(
                                  [controller.isLoading, controller.state]),
                              builder: (context, child) {
                                if (controller.isLoading == true) {
                                  return const CircularProgressIndicator();
                                } else {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.state.value.length,
                                    itemBuilder: (_, index) {
                                      final recipe =
                                          controller.state.value[index];

                                      return ValueListenableBuilder<
                                          List<RecipeModel>>(
                                        valueListenable: controller.state,
                                        builder: (context, value, child) {
                                          return InkWell(
                                            onTap: () => chosenRecipe(recipe),
                                            child: CardProduct(
                                              recipe: recipe,
                                              typeRecipe: 'Drink',
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
