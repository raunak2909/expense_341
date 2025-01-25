import 'package:expenso_341/data/local/db_helper.dart';
import 'package:expenso_341/data/models/user_model.dart';
import 'package:expenso_341/ui/screens/user_onboarding/login_screen.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confPasswordContoller = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  DBHelper dbHelper = DBHelper.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Please register your account to sign in',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                controller: _nameController,
                labelText: 'Name',
                placeholder: 'Enter your full name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: _emailController,
                labelText: 'Email',
                placeholder: 'Enter email address',
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: _phoneNoController,
                labelText: 'Phone No',
                placeholder: 'Enter phone no',
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: _passwordController,
                labelText: 'Password',
                placeholder: 'Enter password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: _confPasswordContoller,
                labelText: 'Confirm password',
                placeholder: 'Re-Enter password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  title: 'Sign Up',
                  onClick: () async {
                    ///register
                    if (!await dbHelper.isUserAlreadyRegistered(
                        email: _emailController.text)) {
                      UserModel newUser = UserModel(uName: _nameController.text,
                          uEmail: _emailController.text,
                          uMobNo: _phoneNoController.text,
                          uPass: _passwordController.text,
                          uCreatedAt: DateTime
                              .now()
                              .millisecondsSinceEpoch
                              .toString());

                      bool check = await dbHelper.registerUser(user: newUser);

                      if(check){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                            Text("User successfully registered, login now!!")));
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                            Text("Something went wrong, please try again!!")));
                      }

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                          Text("User already registered, login now!!")));
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pop(context),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
