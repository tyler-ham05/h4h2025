import 'package:flutter/material.dart';

class CustumSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ["Run", "BasketBall", "Cards"];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        toolbarHeight: 100,
        color: Colors.grey, // Custom AppBar Color
        iconTheme: IconThemeData(color: Colors.white), // Back button color
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(10),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 30,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  TextStyle? get searchFieldStyle => TextStyle(
        fontSize: 22, // 🔥 Fixes small input text
        color: Colors.black,
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matches = [];
    for (var search in searchTerms) {
      if (search.toLowerCase().contains(query.toLowerCase())) {
        matches.add(search);
      }
    }
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        var result = matches[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matches = [];
    for (var search in searchTerms) {
      if (search.toLowerCase().contains(query.toLowerCase())) {
        matches.add(search);
      }
    }
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        var result = matches[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
