import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_delivery/src/modules/auth/auth_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/src/modules/home/home_module.dart';
import 'package:food_delivery/src/modules/profile/profile_module.dart';


class AppModule extends Module {
  @override
  Future<void> routes(r) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user == null) {
      r.module('/', module: AuthModule());
    } else {
      r.module('/', module: HomeModule());
    }
    r.module('/profile/', module: ProfileModule());
  }
}
