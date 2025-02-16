import 'package:flutter/material.dart';
import 'comunity_display.dart';
import 'custom_search.dart';
import 'default_page.dart';
import 'group.dart';
import 'hobby.dart';
import 'tag.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Third Place',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getGroup() async{
    String url = 'http://127.0.0.1:5000/groups';
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    List<Group> groups = [];
    for(var item in responseData){ 
      Group group = Group(
        groupName: item['group_name'],
        description: item['description'],
        address: item['address'],
        image: item['square_image_url_for_group'], 
        hobby: item['attached_hobby'],
      );
      groups.add(group);
    }
    return groups; 
  }
  Future getHobby() async{
    String url = 'http://127.0.0.1:5000/hobbies';
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    List<Hobby> hobbies = [];
    for (var hob in responseData){
      Hobby hobby = Hobby(
        hobby: hob['Hobby'],
        pitch:  hob['Pitch'],
        start:  hob['How to Start'],
        location: hob['Locations'],
        startcost: hob['Starting Cost'],
        tags: hob['Tags'],
        imageSquare: hob['Hobby Square Image'],
        imageBanner: hob['Hobby Landscape Image']
      );
      hobbies.add(hobby);
    }
    return hobbies;
  }
  Future getTags() async{
    String url = 'http://127.0.0.1:5000/tags';
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    List<String> tags = [];
    for(var tag in responseData){
      tags.add(tag);
    }
    return tags;
  }

  
  getMatchingHobby(groups, hobby){
    List<Group> filteredGroups = [
  for (var group in groups) 
    if (group.hobby == hobby.hobby) group
  ];
  return filteredGroups;
}
  int expanded = -1;
  @override
  
  Widget build(BuildContext context) {

    String query = "";

    return FutureBuilder(
      future: Future.wait([getGroup(),getHobby(),getTags()]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
      List<dynamic> groups = snapshot.data?[0];
      List<dynamic> hobbies = snapshot.data?[1];
      List<dynamic> tags = snapshot.data?[2];
      
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: Colors.grey,
                height: 4.0,
              )),
          actionsIconTheme: IconThemeData(size: 75),
          toolbarHeight: 100,
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'logo_tranparent_notext.png',
            ),
          ),
          centerTitle: false,
          title: Text(
            "THIRD PLACE",
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: const Color.fromARGB(255, 90, 89, 89),
                fontSize: 50,
                letterSpacing: 4.5,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 4, // Shadow effect
          iconTheme:
              IconThemeData(color: Colors.grey), // Changes back button color
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustumSearchDelegate(searchTerms: tags),
                );
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: Center(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  itemCount: hobbies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          expanded = index;
                        });
                        //print('You tapped on $index and expanded is $expanded');
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                              margin: EdgeInsets.only(left: 30, right: 30),
                              /* width: MediaQuery.of(context).size.width * 0.25,
                            height: 200,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                              //image: DecorationImage(image: AssetImage('URL goes here'), fit: BoxFit.cover)
                              
                            ),*/
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(width: 50),
                                    RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: "Montserrat"),
                                          text: '${hobbies[index].hobby}\n',
                                          children: [
                                            TextSpan(
                                              text: "${hobbies[index].startcost}",
                                            ),
                                          ]),
                                    ),
                                    Spacer(),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        hobbies[index].imageSquare,
                                        height: 200,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: 5,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              // Container for expanded view
              Container(
                  color: Colors.white,
                  width: MediaQuery.sizeOf(context).width * 0.695,
                  child: (expanded < 0)
                      ? DefaultPage()
                      : ComunityDisplay(hobby:hobbies[expanded], groups: getMatchingHobby(groups, hobbies[expanded]))),
            ],
          ),
        ),
      );
        }
      
    );
  }
}


