import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shebuilds/screens/constants/ConstantWidgits.dart';

import '../../constants.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController kEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void ClearFields() {
      kEmailController.clear();
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your Email ',
              style: kHedTextStyle,
            ),
            SizedBox(
              height: 13,
            ),
            kTextFormField(
              lable: 'Email',
              kController: kEmailController,
              obscure: false,
              icon: Icon(Icons.mail),
              validator: (val) {
                if (val == null || val == "") {
                  return 'Please Enter your Email';
                } else if (regExp.hasMatch(val) == false) {
                  return "Please check your Email";
                }
              },
            ),
            SizedBox(
              height: 13,
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: kEmailController.text.trim())
                    .then((value) => (showDialog(
                        context: (context),
                        builder: (widget) => AlertDialog(
                              title: const Text("email has been sent"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('ok'))
                              ],
                            ))))
                    .onError(
                        (error, stackTrace) => print("${error.toString()}"));

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
                    'Submit',
                    style: kHedTextStyle,
                  ))),
            ),
          ],
        ),
      )),
    );
  }
}
