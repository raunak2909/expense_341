import 'dart:async';
import 'package:expenso_341/ui/screens/expense.dart';
import 'package:expenso_341/ui/screens/user_onboarding/login_screen.dart';
import 'package:expenso_341/ui/screens/user_onboarding/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      var prefs = await SharedPreferences.getInstance();
      int uid = prefs.getInt("UID") ?? 0;

      Widget navigateTo = LoginScreen();

      if (uid > 0) {
        navigateTo = ExpensePage();
      }

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => navigateTo,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Image.asset(
              Assets.expense_tracker_image,
              fit: BoxFit.cover,
            ),*/
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Easy way to monitor your expense',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Safe your future by managing your',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const Text(
              'expense right now',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
