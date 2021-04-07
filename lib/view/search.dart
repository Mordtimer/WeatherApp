import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  String selectedResult;
  List<String> listExample = ["Warszawa", "Katowice", "Poznań", "Gliwice"];
  List<String> recentList = ["Wałbrzych", "Skierniewice"];
  Search(this.recentList, this.listExample);

    @override
    ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.blueGrey[900], 
      scaffoldBackgroundColor: Colors.black,
    textTheme:Theme.of(context).textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.blue,
    ),
    hintColor: Colors.white);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {query = "";},
          )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {Navigator.pop(context);},
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container(
        child:  Center(child: Text(selectedResult),
        ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      List<String> suggestionList = [];
      query.isEmpty
      ? suggestionList = recentList // True
      : suggestionList.addAll(listExample.where(
        (el) => el.toLowerCase().contains(query.toLowerCase()) // False
      ));

      return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(suggestionList[index], style: TextStyle(color: Colors.white),),
            tileColor: Colors.blueGrey[900],
            onTap: (){
              selectedResult = suggestionList[index];
              print(selectedResult);
              close(context, selectedResult);
            },
            );

        }
      );
  }
}