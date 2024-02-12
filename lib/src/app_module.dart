import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_delivery/src/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/', module: HomeModule());
  }
}