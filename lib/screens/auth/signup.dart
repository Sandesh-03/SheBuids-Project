import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shebuilds/screens/constants/ConstantWidgits.dart';
import 'package:shebuilds/screens/home.dart';

import '../../constants.dart';
import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final kSignupFormKey = GlobalKey<FormState>();
  TextEditingController kEmailController = TextEditingController();
  TextEditingController kPasswordController = TextEditingController();
  TextEditingController kNameController = TextEditingController();
  bool isVisible = true;

  @override
  void ClearFields() {
    kPasswordController.clear();
    kEmailController.clear();
    kNameController.clear();
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Center(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Form(
            key: kSignupFormKey,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(scrollDirection: Axis.vertical, children: [
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
                  child: Text('Create Account', style: kHedTextStyle),
                ),
                const SizedBox(height: 40),
                kTextFormField(
                  obscure: false,
                  validator: (val) {
                    if (val == null || val == "") {
                      return 'Please Enter your Name';
                    }
                    return null;
                  },
                  icon: const Icon(Icons.person),
                  lable: 'Name',
                  kController: kNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                kTextFormField(
                  validator: (val) {
                    if (val == null || val == "") {
                      return 'Please Enter your Email';
                    } else if (regExp.hasMatch(val) == false) {
                      return "Please check your Email";
                    }
                    return null;
                  },
                  icon: const Icon(Icons.mail),
                  lable: 'Email',
                  kController: kEmailController,
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
                  icon: const Icon(Icons.key),
                  validator: (val) {
                    if (val == null || val == "") {
                      return 'Please Enter your Email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height / 3,
                  child: const Image(
                    image: AssetImage('assets/girl3.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    kSignupFormKey.currentState!.validate();
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: kEmailController.text.trim(),
                            password: kPasswordController.text)
                        .then((value) => (Navigator.pushReplacement((context),
                            CupertinoPageRoute(builder: (context) => Home()))))
                        .onError((error, stackTrace) =>
                            print("erroe:${error.toString()}"));

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
                        'Register Here',
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
                    const Text("Already A Member"),
                    const SizedBox(
                      width: 18,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            (context),
                            CupertinoPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        "LogIn",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ]),
            )),
          ),
        ),
      ),
    );
  }
}
