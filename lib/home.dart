import 'package:flutter/material.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
       
       body: Row(
         children: [
           Container(
             color: Colors.red,
             width: size.width * 0.6,
             height: size.height * 0.8,
             decoration: BoxDecoration(),
           ),
         ],
       ),
    );
  }
}