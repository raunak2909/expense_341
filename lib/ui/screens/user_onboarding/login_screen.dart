
import 'package:expenso_341/data/local/db_helper.dart';
import 'package:expenso_341/ui/screens/statistics.dart';
import 'package:expenso_341/ui/screens/user_onboarding/registration_screen.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../expense.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DBHelper db = DBHelper.getInstance();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: EdgeInsets.all(15), child: SingleChildScrollView(
        child: Column(
          children: [
            //Image.asset(Assets.login_screen_image, height: 170,),
            Align(alignment: Alignment.topLeft, child: Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),)),
            const SizedBox(height: 8,),
            Align(alignment: Alignment.topLeft, child: Text('Please sign in your account to get started!', style: TextStyle(color: Colors.grey, fontSize: 16),)),
            const SizedBox(height: 15,),
            CustomTextfield(controller: _emailController, labelText: 'Email',),
            const SizedBox(height: 10,),
            CustomTextfield(labelText: 'Password', controller: _passwordController),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: TextButton(onPressed: (){}, child: Text('Forgot password')),
            // ),
            const SizedBox(height: 15,),
            CustomButton(title: 'Sign In', onClick: () async{

              bool check = await db.authenticateUser(email: _emailController.text, pass: _passwordController.text);

              if(check){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                    Text("User successfully Logged-in!!")));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExpensePage(),));

              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                    Text("Invalid Credentials, please login again!!")));
              }

            },),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(fontSize: 16),),
                TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),)), child: Text('Sign Up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),),)
              ],
            )
          ],
        ),
      ),),
    );
  }
}