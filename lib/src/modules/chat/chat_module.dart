import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_delivery/src/modules/chat/pages/chat_screen.dart';
import 'package:food_delivery/src/modules/home/ui/widgets/drawer.dart';
 
class ChatModule extends Module {
  @override
  void routes(r) {
     r.child('/', child: (context) => const DrawerWidget(initialPage: ChatScreen(),));
  }
}