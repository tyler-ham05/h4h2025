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
            {'name': 'Hobby $index', 'description': 'Description $index','communities':'dummy communites'});
    String query = "";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset('h4hlogo.png'),
        title: Text(
          "THIRD PLACE",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.grey, 
            fontSize: 30, 
            fontWeight: FontWeight.bold
          ),
        ),
      
        backgroundColor: const Color.fromARGB(255, 134, 50, 219),
        elevation: 4, // Shadow effect
        centerTitle: true, // Centers the title
        iconTheme: IconThemeData(color: Colors.black), // Changes back button color
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
                color: Colors.yellow,
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
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 200,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                            child: Text(
                              style: TextStyle(fontSize: 30),
                              '${dummydata[index]['name']}'
                              ),
                        
                        ),
   
                      ],
                    ),
                  );
                },
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

