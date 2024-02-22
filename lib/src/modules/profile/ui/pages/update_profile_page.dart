import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_delivery/src/modules/profile/controller/profile_controller.dart';
import 'package:google_fonts/google_fonts.dart';
 
class UpdateProfilePage extends StatefulWidget {
    const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  User? user;
  final newUserName = TextEditingController();
  final newUserEmail = TextEditingController();
  final newUserPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final controller = ProfileController();

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(250, 74, 12, 1),
        leading: IconButton(
              onPressed: () => Modular.to.navigate('/profile/'),
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
              title:   Text('Update your profile',
            style: GoogleFonts.balooTamma2(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.white
            )),
              centerTitle: true,
              toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:50),
          child: Form(
            child: Column(
              children: [
                Center(child: Image.asset(user?.photoURL ?? 'assets/images/profile-img.png')),                
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: newUserName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'New name'
                    ),
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                     controller: newUserEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'New email'
                    ),
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: newUserPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'New password'
                    ),
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: confirmPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm password'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:70),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.sizeOf(context).width,
                    height: 55,
                    child: ElevatedButton(onPressed: () => controller.updateDetailsProfile(newUserName.text, newUserEmail.text, newUserPassword.text),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(250, 74, 12, 1)
                    ), child: const Text('Update', style: TextStyle(color: Colors.white),),)),
                )
               ],
            ),
          ),
        ),
      ),
    );
  }
}