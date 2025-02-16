import 'package:flutter/material.dart';

class HobbyOverview extends StatelessWidget {
  final data;
  const HobbyOverview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
        //image = blah blah blah
        children: [
          //NAME
          SizedBox(
            height: 20,
          ),
          RichText(text: '${data['name']}',
          )
        ]);
  }
}
