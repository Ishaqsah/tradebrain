import 'package:flutter/material.dart';

class stockViewBuilder extends StatelessWidget {
  stockViewBuilder({Key? key}) : super(key: key);

  List<dynamic> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: searchResults.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: Icon(Icons.add),
          title: Text(searchResults[index]['2. name']),
          subtitle: Text(searchResults[index]['1. symbol']),
        );
      },
    );
  }
}
