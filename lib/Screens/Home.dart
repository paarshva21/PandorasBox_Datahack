import 'package:flutter/material.dart';
import 'package:datahack/Screens/UserPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Hello World!")),
      drawer: NavDrawer(),
    );
  }
}
