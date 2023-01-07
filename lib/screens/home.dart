import 'package:flutter/material.dart';

import 'constants/ConstantWidgits.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: const [Image(image: AssetImage('assets/running-girl.png'))],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
