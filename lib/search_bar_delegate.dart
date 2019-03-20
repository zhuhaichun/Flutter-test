import 'package:flutter/material.dart';

import 'asset.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 500.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(query)],
      ),
      color: Colors.lightBlue,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recommendList
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
        onTap: (){
          query = suggestionList[index];
        },
      );
    },
    itemCount: suggestionList.length,);
  }
}
