import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ComunityDisplay extends StatelessWidget {
  const ComunityDisplay({super.key, required data});
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
              width: width * 0.7,
              child: ListView(
                children: [
                            
                          ]
              ),
            ),
            Container(
              color: Colors.brown,
              width: width * 0.3,
              child: ListView(
                children: [
                            
                          ]
              ),
            ),
          ],
        );
        }
    );
  }
}
