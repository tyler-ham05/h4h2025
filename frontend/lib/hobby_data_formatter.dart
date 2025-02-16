import 'package:flutter/material.dart';
import 'group.dart';
import 'hobby.dart';

class HobbyOverview extends StatelessWidget {
  final List<Group> groups;
  final Hobby hobby;
  const HobbyOverview({super.key, required this.groups, required this.hobby});
  // list dummyData = {'name':name, 'description':desc, 'communities':desc}

  @override
  Widget build(BuildContext context) {
    list_str_to_str(list_str){
      String str = "";
      for (var st in list_str){
        str += st;
      }
      return str;
    }
    return ListView(
        //image = blah blah blah
        children: [
          //NAME
          SizedBox(
            height: 20,
          ),
          Container(
              width: 600,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  //Banner
                  hobby.imageBanner,
                ),
              )),
          SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: hobby.hobby + "\n\n",
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
                      fontWeight: FontWeight.w500)),
              TextSpan(
                text: hobby.pitch + "\n\n\n",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              TextSpan(
                text: "How to Get Started\n",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: hobby.start + "\n\n\n",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              TextSpan(
                text: "Tags\n",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: list_str_to_str(hobby.tags) + "\n\n\n",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              TextSpan(
                  text: "Comunities:",
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color.fromARGB(255, 85, 82, 82),
                    fontWeight: FontWeight.bold,
                  ))
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Wrap(
              spacing: 10, // Horizontal spacing
              runSpacing: 10, // Vertical spacing
              children: List.generate(groups.length, (index) {
                return Container(
                  width: 580,
                  child: Card(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              groups[index].image,
                              width: 580,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                  ),
                                 groups[index].groupName)),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ]);
  }
}
