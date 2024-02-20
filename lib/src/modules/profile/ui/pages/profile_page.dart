import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery/src/modules/profile/ui/widgets/card_info.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(-0.9, -0.85),
            child: IconButton(
                onPressed: () => ZoomDrawer.of(context)!.toggle(),
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
          Align(
            alignment: const Alignment(-0.65, -0.65),
            child: Text(
              'My profile',
              style: GoogleFonts.balooTamma2(
                fontWeight: FontWeight.w700,
                fontSize: 34,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.65, -0.45),
            child: Text(
              'Personal details',
              style: GoogleFonts.balooTamma2(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          const Align(alignment: Alignment(-0.5, -0.20), child: CardInfo()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                width: MediaQuery.sizeOf(context).width,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(250, 74, 12, 1)),
                    onPressed:()=> Modular.to.navigate('/profile/update/'),
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ))),
          )
        ],
      ),
    ));
  }
}
