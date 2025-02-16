import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'hobby_data_formatter.dart';

class ComunityDisplay extends StatelessWidget {
  final data;
  const ComunityDisplay({super.key, required this.data});
  /*
  list dummyData = {'name':name, 'description':desc, 'communities':desc}
*/
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      return Row(
        children: [
          SizedBox(width: 20,),
          Container(
            color: Colors.white,
            width: width -20,
            child: Container(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: HobbyOverview(data: data),
            ),
          ),
        ],
      );
    });
  }
}
