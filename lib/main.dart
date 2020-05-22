import 'package:flutter/material.dart';
import 'package:sportsconnectflutter/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
          primarySwatch: Colors.blue,  fontFamily: 'Poppins'
      ),
      home: MyHomePage(title: 'Sports Connect'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,

      home: LoginPage(), //navigate to loginpage in folder ui
    );
  }
}
