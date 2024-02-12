import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
       theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 242, 242, 242)
        ),
      routerConfig: Modular.routerConfig,
    ); //added by extension 
  }
}
