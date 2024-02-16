import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery/src/modules/home/models/item_model.dart';
import 'package:food_delivery/src/modules/home/ui/pages/home_page.dart';
import 'package:food_delivery/src/modules/home/ui/pages/profile_page.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Widget page = const HomePage();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
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
        showShadow: true,
        drawerShadowsBackgroundColor: Colors.blueGrey,
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
        icon: const Icon(Icons.person_pin),
        title: const Text('Profile'),
        page: const HomePage()),
    ItemModel(
        icon: const Icon(Icons.add_shopping_cart_outlined),
        title: const Text('Orders'),
        page: const ProfilePage())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listItems
            .map((e) => ListTile(
                  onTap: () {
                    widget.onPageChange(e.page);
                  },
                  title: e.title,
                  leading: e.icon,
                ))
            .toList(),
      ),
    );
  }
}

 