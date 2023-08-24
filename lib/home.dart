import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
     title: Text('Home'),
      centerTitle: true,
      backgroundColor: Colors.cyan,
      shadowColor: Colors.black,
      elevation: 4.0,
    ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have clicked the button this many times'),
            Text('1', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600)
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
          onPressed: (){},
        backgroundColor: Colors.lightBlueAccent,
        shape: CircleBorder(eccentricity: 0.5),
        child: Icon(
            Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
