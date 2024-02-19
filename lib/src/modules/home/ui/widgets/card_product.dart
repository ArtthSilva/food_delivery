import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15,right:5),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
               width: MediaQuery.sizeOf(context).width / 2,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Center(
                      child: Text(
                    'Veggie tomato mix',
                    style: GoogleFonts.balooTamma2(
                      fontWeight: FontWeight.w600,
                       fontSize: 16,
                    ),
                  )),
                  Center(
                      child: Text(
                    'Fácil',
                    style: GoogleFonts.balooTamma2(
                      fontWeight: FontWeight.w600,
                       fontSize: 16,
                       color: Colors.green
                    ),
                  )),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1, -0.8),
            child: Image.asset('assets/images/food-img1.png', height: 180,),
          )
        ],
      ),
    );
  }
}
