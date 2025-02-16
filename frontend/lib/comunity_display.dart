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
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      return Row(
        children: [
          Container(
            color: Colors.white,
            width: width * 0.6,
            child: ListView(children: [
              Container(
                  child: Column(
                children: [
                  Text(data["name"]),
                ],
              )),
            ]),
          ),
          Container(
            color: Colors.white,
            width: width * 0.4,
            child: 
              ListView.builder(
                itemCount: data['communities'].length,
                itemBuilder: (context,index){
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
                              style: TextStyle(fontSize: 30),
                              '${data['communities'][index]}'
                            ),   
                                Text(
                                  style: TextStyle(fontSize: 15),
                                  'XXXX members'
                                
                                ),
                              ],
                            )
                        ),
                      ],
                    );
                  
                },
              )
            ,
          ),
        ],
      );
    });
  }
}
