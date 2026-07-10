import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {



  FirebaseAuth auth = FirebaseAuth.instance;

  ///
  ///
  final List<String> scopes = ['email', 'profile'];
  bool isGoogleInitialized = false;



  // Google Auth Initialization

  Future<void> ensureInitialized()async{
   if (!isGoogleInitialized) {
      await GoogleSignIn.instance.initialize();
   }
  }



  Future<void> signInwithGoogle()async{
     await ensureInitialized();

    final GoogleSignInAccount? account = await GoogleSignIn.instance
        .authenticate();
    if (account == null) throw 'Sign-in cancelled';

    final GoogleSignInAuthentication googleAuth = await account.authentication;

    // Extract v7+ Authorization for accessToken
    final GoogleSignInClientAuthorization? authorization = await account
        .authorizationClient
        .authorizationForScopes(scopes);

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: authorization?.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await auth.signInWithCredential(
      credential,
    );
  }





  // Sign Up 




  Future<void> signUp(String userEmail, String userPassword)async{

    try {
       await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
    } catch (e) {
      
    }
   

  }


  // Login 

  Future<void> login(String userEmail, String userPassword)async{
    await auth.signInWithEmailAndPassword(email: userEmail, password: userPassword);
  }



  // Anonymous

  Future<void> signInAnonymously()async{
    await auth.signInAnonymously();
  }


  // forget Password


  Future<void> resetPassword(String email)async{
    await auth.sendPasswordResetEmail(email: email);
  }



  // Logout


  Future<void> logOut()async{
    await auth.signOut();
  }
  
}