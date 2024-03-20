import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_delivery/src/modules/auth/ui/pages/initial_page.dart';

class AuthModule extends Module {
    @override
  void routes(r) {
    r.child('/', child: (context) => const InitialPage());
  }
  
}