import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shebuilds/constants.dart';

class kTextFormField extends StatelessWidget {
  kTextFormField({
    required this.lable,
    Key? key,
    required this.kController,
    this.suffixIcon,
    required this.obscure,
    required this.icon,
    required this.validator,
  }) : super(key: key);

  final TextEditingController kController;
  String lable;
  Widget icon;
  Widget? suffixIcon;
  bool obscure;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardAppearance: TextInputType.text,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.start,
      controller: kController,
      cursorHeight: 25,
      cursorRadius: const Radius.circular(9),
      scrollPadding: const EdgeInsets.symmetric(horizontal: 5),
      // style: ,
      validator: validator,
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: icon,
        labelText: lable,
        labelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
              color: Colors.redAccent,
              style: BorderStyle.solid,
              strokeAlign: StrokeAlign.inside),
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: kpurpleShade,
      animationDuration: Duration(microseconds: 500),
      // animationCurve: Curves.bounceInOut,
      items: [
        Icon(Icons.home_filled),
        Icon(Icons.stacked_bar_chart),
        Icon(Icons.radar),
      ],
    );
  }
}
