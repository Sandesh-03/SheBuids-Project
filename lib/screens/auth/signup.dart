import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shebuilds/screens/auth/loginpage.dart';
import 'package:shebuilds/screens/constants/ConstantTextForm.dart';

import '../../constants.dart';

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
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Form(
          key: kSignupFormKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      obscure: false,
                      validator: (val) {
                        if (val == null || val == "") {
                          return 'Please Enter your Email';
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
                        }
                        return null;
                      },
                      icon: const Icon(Icons.mail),
                      lable: 'Email',
                      kController: kNameController,
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
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        kSignupFormKey.currentState!.validate();
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
                        const Text("Already A Mmber"),
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
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
