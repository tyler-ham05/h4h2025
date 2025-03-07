import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Image.asset("assets/h4hlogo.png"),
        Text(
          'Pick a hobby to get started',
          style: TextStyle(
              color: Colors.black, fontSize: 40, fontFamily: "Montserrat"),
        ),
      ],
    ));
  }
}
