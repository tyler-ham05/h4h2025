import 'package:flutter/material.dart';

class HobbyOverview extends StatelessWidget {
  final data;
  const HobbyOverview({super.key, required this.data});
  // list dummyData = {'name':name, 'description':desc, 'communities':desc}
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
            height: 300,
            child: Image.network('https://picsum.photos/250?image=9')
          ), 
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: data['name'] + "\n\n",
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color.fromARGB(255, 85, 82, 82),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Overview\n",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500
                  )
                ),
                TextSpan(
                  text: data['description'] + "\n\n\n",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey
                  ),
                ),
                TextSpan(
                  text: "How to Get Started\n",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500
                  ),
                ),
                TextSpan(
                  text: data['quickstart'] + "\n\n\n",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey
                  ),
                ),
                TextSpan(
                  text: "Tags\n",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500
                  ),
                ),
                TextSpan(
                  text: data['tags'],
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey
                  ),
                )
              ]
            ),
          ),
        ]);
  }
}
