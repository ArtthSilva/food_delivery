import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(234, 255, 84, 68),
        body: Stack(
          children: [
            Align(
              alignment: const Alignment(-0.7, -0.90),
              child: Container(
                width: 60,
                decoration:const  BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              
                child: Image.asset('assets/images/logo_app.png')),
            ),

            Align(
              alignment:const Alignment(-0.3, -0.51),
              child: Text(
                'Everyone ',
                style: GoogleFonts.balooTamma2(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 52,
                ),
              ),
            ),
            Align(
                alignment: const Alignment(1, 0.7),
                child: Image.asset('assets/images/homem_toy.png')),
            Align(
                alignment: const Alignment(1, 1.3),
                child: SizedBox(
                  width: 250,
                  child: Image.asset('assets/images/blur_homem.png'),
                )),
            Align(
                alignment: const Alignment(-2.5, 0.8),
                child: Image.asset('assets/images/mulher_toy.png')),
            Align(
              alignment: const Alignment(-1, 1.08),
              child: SizedBox(
                width: 300,
                child: Image.asset('assets/images/blur_mulher.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                padding: const EdgeInsets.only(left: 30, right: 30),
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Get started', style: TextStyle(color: Color.fromRGBO(201, 58, 10, 0.795)),),
                ),
              ),
            ),
                        Align(
             alignment: const Alignment(-0.35, -0.63),
              child: Text(
                'Food for ',
                style: GoogleFonts.balooTamma2(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 52,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
