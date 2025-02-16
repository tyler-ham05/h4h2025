import 'package:flutter/material.dart';
import 'comunity_display.dart';
import 'custom_search.dart';
import 'default_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  int expanded = -1;
  @override
  Widget build(BuildContext context) {
    var dummydata = List.generate(
        5,
        (index) =>
            {'name': 'Hobby $index', 'description': 'Description $index','quickstart': 'This is some instruction on how you would get started for this hobby.','communities':['community 0','community 1','community 2'], 'tags':"Athleic, Something, Some other tags"});
    String query = "";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
              color: Colors.grey,
              height: 4.0,
          )
        ),
        actionsIconTheme: IconThemeData(
          size: 75
        ),
        toolbarHeight: 100,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset('logo_tranparent_notext.png',),
        ),
        centerTitle: false,
        title: Text(
          "THIRD PLACE",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: const Color.fromARGB(255, 90, 89, 89), 
            fontSize: 50,
            letterSpacing: 4.5,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 4, // Shadow effect
        iconTheme: IconThemeData(color: Colors.grey), // Changes back button color
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustumSearchDelegate(),
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
              margin: EdgeInsets.only(top: 10, bottom:10), 
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                itemCount: dummydata.length,
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
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Spacer(),
                                RichText(text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: "Montserrat"
                                      ),
                                    text: '${dummydata[index]['name']}\n',
                                    children: [
                                    TextSpan(
                                      text: "\$\$\$\$",
                                    ),
                                    ]
                                  ),
                                ),
                                Spacer(),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "https://i.imgur.com/NXSSdB2.jpeg",
                                    height: 200,
                                    
                                  ),
                                ),
                          
                    
                              ],
                            ),
                          )
                        ),
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
              child: (expanded < 0) ? DefaultPage() : ComunityDisplay(data: dummydata[expanded])
              ),
            ],
          ),
        ),
      );
  }
}

