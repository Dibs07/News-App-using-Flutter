import 'package:flutter/material.dart';
//Newws app using news Api
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: buildUi(),
    );
  }
  Widget buildUi(){
    return Center(
      child: Text('Welcome to News App'),
    );
  }
}