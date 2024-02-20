import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery/src/modules/home/models/item_model.dart';
import 'package:food_delivery/src/modules/home/ui/pages/home_page.dart';
 
class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key, required this.initialPage});
  final initialPage;
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Widget page = const HomePage();

    @override
  void initState() {
    super.initState();
    page = widget.initialPage;
  }
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      angle: -0,
      slideWidth: MediaQuery.of(context).size.width*.60,
        menuScreen: Builder(builder: (context) {
          return MenuScreen(
            onPageChange: (a) {
              setState(() {
                page = a;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        }),
        mainScreen: page,
        borderRadius: 24,
         drawerShadowsBackgroundColor: Colors.deepOrange,
        menuBackgroundColor: Colors.deepOrange);
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.onPageChange});
  final Function(Widget) onPageChange;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<ItemModel> listItems = [
    ItemModel(
        icon: const Icon(Icons.home_outlined,color: Colors.white,),
        title: const Text('Home',style: TextStyle(color: Colors.white),),
        onSelected: ()=> Modular.to.navigate('/')),
    ItemModel(
        icon: const Icon(Icons.person_pin_outlined,color: Colors.white,),
        title: const Text('Profile',style: TextStyle(color: Colors.white),),
        onSelected:()=> Modular.to.navigate('/profile/'))
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listItems
              .map((e) => ListTile(
                    onTap: () {
                      e.onSelected();
                    },
                    title: e.title,
                    leading: e.icon,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

 