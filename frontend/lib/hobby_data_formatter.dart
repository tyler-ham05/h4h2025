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
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(style: TextStyle(fontSize: 30), '${data['name']}'),
          ),
          
          //Description
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
                style: TextStyle(fontSize: 30), '${data['description']}'),
          ),

        ]);
  }
}
