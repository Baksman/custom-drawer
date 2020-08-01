
import 'package:flutter/material.dart';


import 'package:nice/widgets/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      //theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  drawer: CollapsingNavigationDrawer(),
        // appBar: AppBar(
        //   elevation: 0,
        // ),
        body: Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        CollapsingNavigationDrawer(),
      ],
    ));
  }
}
