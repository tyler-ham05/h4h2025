import 'package:flutter/material.dart';

class HobbyOverview extends StatelessWidget {
  final data;
  const HobbyOverview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
        //image = blah blah blah
        children: [
          //NAME
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(style: TextStyle(fontSize: 30), '${data['name']}'),
          ),
          
          //
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
                style: TextStyle(fontSize: 30), '${data['description']}'),
          ),
        ]);
  }
}
