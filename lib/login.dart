import 'package:bus_booking/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<String?> _authUser(LoginData data) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
      return null; // No error, sign-in successful
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    try {
      String email = data.name ??
          ''; // Convert nullable email to non-nullable with default value
      String password = data.password ??
          ''; // Convert nullable password to non-nullable with default value
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Signup successful, return null (no error)
      return null;
    } on FirebaseAuthException catch (e) {
      // Signup failed, return error message
      return e.message ?? 'Unknown error occurred during signup';
    }
  }

  Future<String> _recoverPassword(String name) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: name);
      return 'Check your email to reset password';
    } catch (e) {
      return e.toString(); // Return error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      // logo: AssetImage('assets/ttl.jpg'),
      title: 'trekkers and tourism',
      theme: LoginTheme(
        footerBackgroundColor: Colors.white,
        // footerBackgroundColor:Colors.green,
        switchAuthTextColor: Colors.green,
        primaryColor: Colors.green, // Set primary color to green
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 40, // Set the desired font size for the title
          fontWeight: FontWeight.bold, // Optionally, adjust font weight
        ),
      ),
      onLogin: _authUser,
      onSignup: _signupUser, // Assign signup function here
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
