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
            width: width * 0.6-20,
            child: HobbyOverview(data: data),
          ),
          Container(
            color: Colors.white,
            width: width * 0.4,
            child: ListView.builder(
              itemCount: data['communities'].length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
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
                      child: Column(
                        children: [
                          Text(
                            '${data['communities'][index]}',
                            style: TextStyle(fontSize: 30, fontFamily: "Montserrat"),
                          ),
                          Text(
                            'XXXX members',
                            style: TextStyle(fontSize: 15, fontFamily: "Montserrat"),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
