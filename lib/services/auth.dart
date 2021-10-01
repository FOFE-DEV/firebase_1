import 'package:firebase_1/models/user.dart' as U;
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;

  // create user based on firebase user
  U.User? _userFromFirebase(UserCredential userCredential){
    User? user = _auth.currentUser;
    // ignore: unnecessary_null_comparison
    return userCredential != null ? U.User(uid: user!.uid):null;
  }

  // auth user  change stream
  Stream<User?>get user{
    return _auth.authStateChanges();
  }
  Future signAnon()async{
    try {
      UserCredential result=(await _auth.signInAnonymously());
      return _userFromFirebase(result);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logout()async{
    return await _auth.signOut();
  }
}