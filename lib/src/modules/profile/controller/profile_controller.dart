
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> updateDetailsProfile(String newUserName, String newUserEmail, String newUserPassword) async {
    User? user = _auth.currentUser;
    if (newUserName.isNotEmpty) {
      await user!.updateDisplayName(newUserName);
    }    
    if (newUserEmail.isNotEmpty) {
      await user!.verifyBeforeUpdateEmail(newUserEmail);
    }if (newUserPassword.isNotEmpty) {
      await user!.updatePassword(newUserPassword);
    }
 
  }
}
