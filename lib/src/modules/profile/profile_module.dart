
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_delivery/src/modules/home/ui/widgets/drawer.dart';
import 'package:food_delivery/src/modules/profile/ui/pages/profile_page.dart';
import 'package:food_delivery/src/modules/profile/ui/pages/update_profile_page.dart';

class ProfileModule extends Module{ 
    @override
  void routes(r) {
     r.child('/', child: (context) => const DrawerWidget(initialPage: ProfilePage()));
     r.child('/update/', child: (context) => const UpdateProfilePage());
  }
}