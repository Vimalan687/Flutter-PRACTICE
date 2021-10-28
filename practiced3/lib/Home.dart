
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {


  /// The user selects a file, and the task is added to the list.

  /// The user selects a file, and the task is added to the list.

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text("HOME"),
          backgroundColor: Colors.lightBlue,
        ),
       
      ),
    );
  }

  

  
}
