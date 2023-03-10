import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shebuilds/constants.dart';
import 'package:shebuilds/screens/auth/forget%20password.dart';
import 'package:shebuilds/screens/auth/signup.dart';

import '../constants/ConstantWidgits.dart';
import '../constants/Exercise.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //-----sizes-----//
  //--------------------//
  final kLogInFormKey = GlobalKey<FormState>();
  TextEditingController kEmailController = TextEditingController();
  TextEditingController kPasswordController = TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    void ClearFields() {
      kPasswordController.clear();
      kEmailController.clear();
      // kNameController.clear();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Form(
          key: kLogInFormKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Hey there,',
                  style: kDescTextStyle,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text('Welcome Back', style: kHedTextStyle),
              ),
              const SizedBox(height: 40),
              kTextFormField(
                icon: const Icon(Icons.mail),
                kController: kEmailController,
                lable: 'Email',
                validator: (val) {
                  if (val == null || val == "") {
                    return 'Please Enter your Email';
                  } else if (regExp.hasMatch(val) == false) {
                    return "Please check your Email";
                  }
                },
                obscure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              kTextFormField(
                suffixIcon: IconButton(
                  icon: isVisible
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 25,
                          semanticLabel: 'show password',
                        )
                      : const Icon(Icons.visibility_off,
                          size: 25, semanticLabel: 'Hide password'),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
                lable: 'Password',
                kController: kPasswordController,
                obscure: isVisible,
                icon: Icon(Icons.key),
                validator: (val) {
                  if (val == null || val == "") {
                    return 'Please Enter your Password';
                  }
                },
              ),
              SizedBox(
                height: height / 3,
                child: const Image(
                  image: AssetImage('assets/girl-meditatimg.png'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  kLogInFormKey.currentState!.validate();

                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: kEmailController.text.trim(),
                          password: kPasswordController.text)
                      .then((value) => (Navigator.pushReplacement(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => ExercisePage()))))
                      .onError((error, stackTrace) => print("$error"));
                  ClearFields();
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kpurpleShade,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: width / 2,
                    child: const Center(
                        child: Text(
                      'Login Here',
                      style: kHedTextStyle,
                    ))),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                height: 3,
                thickness: 0.5,
                color: Colors.purple,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have Account"),
                  const SizedBox(
                    width: 18,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          CupertinoPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: const Text(
                      "Join Now",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push((context),
                      CupertinoPageRoute(builder: (context) => ForgetPass()));
                },
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
