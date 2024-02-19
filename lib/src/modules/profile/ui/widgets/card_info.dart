import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
class CardInfo extends StatefulWidget {
  const CardInfo({super.key});

  @override
  State<CardInfo> createState() => _CardInfoState();
}


class _CardInfoState extends State<CardInfo> {
  User? user;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
 
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.sizeOf(context).width,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Image.asset(user?.photoURL ?? 'assets/images/profile-img.png'),
          const SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text(user?.displayName ?? '',style: GoogleFonts.balooTamma2(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),),
                Text(user?.email ?? '',style: GoogleFonts.balooTamma2(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
