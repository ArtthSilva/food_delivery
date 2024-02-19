import 'package:flutter/material.dart';
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
            alignment: Alignment(-0.8, -0.85),
            child: IconButton(
                onPressed: () => ZoomDrawer.of(context)!.toggle(), icon: Icon(Icons.arrow_back_ios_new)),
          ),
          Align(
            alignment: Alignment(-0.55, -0.65),
            child: Text('My profile',style: GoogleFonts.balooTamma2(
                  fontWeight: FontWeight.w700,
                   fontSize: 34,
                ),),
          ),  Align(
            alignment: Alignment(-0.55, -0.45),
            child: Text('Personal details',style: GoogleFonts.balooTamma2(
                  fontWeight: FontWeight.w700,
                   fontSize: 18,
                ),),
          ),  Align(
            alignment: Alignment(-0.6, -0.15),
            child: CardInfo()
          ),
         ],
      ),
    ));
  }
}
