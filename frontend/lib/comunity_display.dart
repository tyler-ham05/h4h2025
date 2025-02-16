import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'hobby_data_formatter.dart';
import "hobby.dart";
import "tag.dart";
import "group.dart"; 

class ComunityDisplay extends StatelessWidget {
  final List<Group> groups;
  final Hobby hobby;
  const ComunityDisplay({super.key, required this.hobby, required this.groups});
  /*
  list dummyData = {'name':name, 'description':desc, 'communities':desc}
*/
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      return Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            color: Colors.white,
            width: width - 20,
            child: Container(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: HobbyOverview(groups: groups, hobby: hobby,),
            ),
          ),
        ],
      );
    });
  }
}
