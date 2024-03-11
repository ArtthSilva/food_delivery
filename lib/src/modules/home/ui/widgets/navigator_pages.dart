 import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/home/ui/pages/home_page.dart';
import 'package:food_delivery/src/modules/home/ui/pages/favorites_recipes_page.dart';
import 'package:food_delivery/src/modules/home/ui/widgets/drawer.dart';
 
 class NavigatorPages extends StatefulWidget {
 
   const NavigatorPages({ super.key });
 
   @override
   State<NavigatorPages> createState() => _NavigatorPagesState();
 }
 
 class _NavigatorPagesState extends State<NavigatorPages> {
  int _indiceAtual = 0;
  int opcao = 1;
 
    @override
    Widget build(BuildContext context) {
        return Scaffold(
             
            body: SafeArea(
              child: IndexedStack(
                index: _indiceAtual,
                children: const [
                  DrawerWidget(initialPage: HomePage()),
                  DrawerWidget(initialPage:  FavoriteRecipesPage()),
                 
                ],
              ),
            ),
            bottomNavigationBar:  BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      currentIndex: _indiceAtual,
                      onTap: (opcao) {
                        setState(() {
                          _indiceAtual = opcao;
                        });
                      }
                       ,
                      items: const [
                        BottomNavigationBarItem(
                            tooltip: 'home',
                            activeIcon: Icon(Icons.home,color: Colors.red,),
                            icon: Icon(Icons.home_outlined),
                            label: 'asda'),
                        BottomNavigationBarItem(
                          tooltip: 'favoritos',
                            icon: Icon(Icons.favorite_border),
                            activeIcon: Icon(Icons.favorite, color: Colors.red,),
                             label: 'asdsa'),
                      ]),
        );
   }
 }