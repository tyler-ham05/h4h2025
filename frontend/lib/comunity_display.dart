import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ComunityDisplay extends StatelessWidget {
  final data; 
  const ComunityDisplay({super.key, required this.data});
  /*
  list dummyData = {'name':name, 'description':desc, 'communities':desc}
*/
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        return Row(
          children: [
            Container(
              color: Colors.blue,
              width: width * 0.6,
              child: ListView(
                children: [
                Container(
                  child: Column(
                    children: [
                      Text(data["name"]),
                      
                    ],
                  )
                ),
                          ]
              ),
            ),
            Container(
              color: Colors.brown,
              width: width * 0.4,
              child: ListView(
                children: [
                  Text(
                    style: TextStyle(
                                  fontSize: 40,fontFamily: "Montserrat"
                    ),
                    'Communities'
                    )
                            
                          ]
              ),
            ),
          ],
        );
        }
    );
  }
}
