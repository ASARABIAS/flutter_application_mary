import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_mary/ui/pages/Nav_page.dart';
import 'package:flutter_application_mary/ui/pages/login_page.dart';



class FirebaseCentral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Nav_page();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}