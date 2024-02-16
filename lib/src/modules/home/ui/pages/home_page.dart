import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: const Color.fromARGB(255,  242,  242,  242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          child: Image.asset('assets/images/menu_icon.png'),
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
             Text('asd')
          ],
        ),
      ),
    );
  }
}