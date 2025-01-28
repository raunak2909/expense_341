import 'package:expenso_341/ui/screens/bloc/expense_bloc.dart';
import 'package:expenso_341/ui/screens/expense.dart';
import 'package:expenso_341/ui/screens/user_onboarding/login_screen.dart';
import 'package:expenso_341/ui/screens/user_onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/local/db_helper.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ExpenseBloc(db: DBHelper.getInstance()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            // First Image (U2.png)
            Image.asset(
              "assets/images/U2.png",
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 70),
            // Stack for overlapping images and text
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Box Image (U6.png - Grey Rectangle)
                Image.asset(
                  "assets/images/u6.png",
                  width: 300,
                  height: 400,
                  fit: BoxFit.contain,
                ),
                // Overlapping Image (UI1.png)
                Positioned(
                  top: -60, // Adjust the overlap amount
                  child: Image.asset(
                    "assets/images/ui1.png",
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
                // Text and circles positioned on the overlapping images
                Positioned(
                  bottom: 70, // Adjust the position relative to U6.png
                  child: Column(
                    children: [
                      const Text(
                        "Easy way to monitor",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Your expense",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Safe Your Future by managing Your",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "expense right now",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      // Circles
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 4, // Size of the circle
                            backgroundColor: Colors.yellow.shade300,
                          ),
                          const SizedBox(width: 5), // Spacing between circles
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Arrow button on the grey rectangle (U6.png)
                Positioned(
                  bottom: 20, // Adjust vertical position
                  right: 20, // Adjust horizontal position
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Dashboard
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(15), // Rounded rectangle
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Dashboard Page
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Dashboard!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
