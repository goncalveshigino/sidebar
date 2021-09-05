import 'package:flutter/material.dart'; 

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aqui'),
        centerTitle: true,
      ),
      body: Container(
        
        color: Colors.red,
      ),
    );
  }
}