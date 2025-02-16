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
              width: 600,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  //Banner
                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f938e5e7-be0e-4aad-a3d2-038c0c6eb150/dfgl5z5-61cd2321-a27d-4691-9f45-a7a9f936e76b.jpg/v1/fill/w_1280,h_427,q_75,strp/goku_banner_by_therandomshan_dfgl5z5-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NDI3IiwicGF0aCI6IlwvZlwvZjkzOGU1ZTctYmUwZS00YWFkLWEzZDItMDM4YzBjNmViMTUwXC9kZmdsNXo1LTYxY2QyMzIxLWEyN2QtNDY5MS05ZjQ1LWE3YTlmOTM2ZTc2Yi5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.bN4zhERfwijTVFPWUpg2ZHX0jGhN_2oTyFY9LPQUTtg',
                  height: 400,
                ),
              )),
          SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(children: [
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
                      fontWeight: FontWeight.w500)),
              TextSpan(
                text: data['description'] + "\n\n\n",
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
                text: data['quickstart'] + "\n\n\n",
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
                text: data['tags'] + "\n\n\n",
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
              children: List.generate(data['communities'].length, (index) {
                return Container(
                  width: 580,
                  child: Card(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              "https://media.istockphoto.com/id/1216337574/vector/abstract-creative-background.jpg?s=612x612&w=0&k=20&c=hFANJRQk1tOuYyU8rWaeA9olEutui-m1lZhsb4gB9pI=",
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
                                  "Comunity Somthing")),
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
