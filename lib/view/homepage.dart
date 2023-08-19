
import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:train_brain/models/stockhive.dart';

import '../funtions/funtions.dart';

class screenHomepage extends StatefulWidget {
  const screenHomepage({super.key});

  @override
  State<screenHomepage> createState() => _screenHomepageState();
}

class _screenHomepageState extends State<screenHomepage> {
  final String apiKey = 'DMGFFYA37RG972FN';
  final String baseUrl = 'https://www.alphavantage.co/query';

  bool isdatevisible = true;
  TextEditingController searchcontroller = TextEditingController();

  List<dynamic> searchResults = [];

  

  void searchStocks(String keyword) async {
    
      if (keyword.isNotEmpty) {
        String url =
            '$baseUrl?function=SYMBOL_SEARCH&keywords=$keyword&apikey=$apiKey';
        var response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          setState(() {
            searchResults = json.decode(response.body)['bestMatches'];
          });
        } else {
          print('Error fetching data');
        }
      } else {
        setState(() {
          searchResults = [];
        });
      }
    }
  
//
//
//   function for add wishlist
//


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(children: [
              Expanded(
                ///
                //////  search bar
                /////
                

                child: TextField(
                  onChanged: searchStocks,
                 
                  controller: searchcontroller,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: 
                                Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            alignment: AlignmentDirectional.centerStart,
            child: Visibility(
              visible: isdatevisible,
              child: Text(
                'Trade now ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0xffEBF5EE),
                  elevation: 0,
                  child: ListTile(
                    
                    title: Row(
                      children: [
                        Flexible(child: Text(searchResults[index]['2. name'])),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: Text(
                          searchResults[index]["9. matchScore"],
                          style: TextStyle(color: Colors.green),
                        )),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.add_circle),
                        onPressed: () {

                              final stockData = StockData(
                        searchResults[index]['2. name'],
                        searchResults[index]['9. matchScore'],
                      );
                      addToHive(stockData);

                        }, ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 5,
                );
              },
            ),
          ),
        ],
      ))),
    );
  }
}


