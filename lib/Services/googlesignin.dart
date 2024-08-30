import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignServices {
  static final googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();
}
