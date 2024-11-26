import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/api/mainscreen.dart';
import 'package:newsapp/newssetails.dart';
import 'api/newsapi.dart';
import 'api/viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Every Day',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(

          title: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: RichText(
                textAlign: TextAlign.center, // Centers the text
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Every',
                      style: TextStyle(color: Colors.blue, fontSize: 24),
                    ),
                    TextSpan(
                      text: 'Day',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
           // Sets the background to black
          // Centers the title within the app bar
          actions: [
            // Country Select PopupMenuButton
            PopupMenuButton<String>(
              onSelected: (country) {
                // Handle country selection
                print("Selected Country: $country");
              },
              itemBuilder: (BuildContext context) {
                // List of country codes
                List<String> countryCodes = [
                  "ae",
                  "at",
                  "au",
                  "be",
                  "bg",
                  "br",
                  "ca",
                  "ch",
                  "cn",
                  "co",
                  "cz",
                  "de",
                  "eg",
                  "fr",
                  "gb",
                  "gr",
                  "hk",
                  "hu",
                  "id",
                  "ie",
                  "il",
                  "in",
                  "jp",
                  "kr",
                  "lt",
                  "lv",
                  "ma",
                  "mx",
                  "ng",
                  "nl",
                  "no",
                  "nz",
                  "ph",
                  "pl",
                  "pt",
                  "ro",
                  "rs",
                  "ru",
                  "sa",
                  "se",
                  "sg",
                  "si",
                  "sk",
                  "th",
                  "tr",
                  "tw",
                  "ua",
                  "us",
                  "ve",
                  "za"
                ];

                return countryCodes.map((code) {
                  return PopupMenuItem<String>(
                    value: code,
                    child: Text(code.toUpperCase()),
                  );
                }).toList();
              },
              icon: Icon(Icons.language, color: Colors.white),
            ),
            // Category Buttons
          ],
          backgroundColor: Colors.black,
        ),

        body: Mainscreen(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Category: ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection:
                    Axis.horizontal, // Enable horizontal scrolling
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                            onPressed: () {
// Your onPressed logic for Business here
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.grey), // Grey border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Circular border
                              ),
                            ),
                            child: Text(
                              'Business',
                              style: TextStyle(
                                color: Colors.grey, // Grey text
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                            onPressed: () {
// Your onPressed logic for Entertainment here
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.grey), // Grey border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Circular border
                              ),
                            ),
                            child: Text(
                              'Entertainment',
                              style: TextStyle(
                                color: Colors.grey, // Grey text
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                            onPressed: () {
// Your onPressed logic for General here
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.grey), // Grey border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Circular border
                              ),
                            ),
                            child: Text(
                              'General',
                              style: TextStyle(
                                color: Colors.grey, // Grey text
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                            onPressed: () {
// Your onPressed logic for Health here
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.grey), // Grey border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Circular border
                              ),
                            ),
                            child: Text(
                              'Health',
                              style: TextStyle(
                                color: Colors.grey, // Grey text
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                            onPressed: () {
// Your onPressed logic for Science here
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.grey), // Grey border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Circular border
                              ),
                            ),
                            child: Text(
                              'Science',
                              style: TextStyle(
                                color: Colors.grey, // Grey text
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                            onPressed: () {
// Your onPressed logic for Sports here
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.grey), // Grey border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Circular border
                              ),
                            ),
                            child: Text(
                              'Sports',
                              style: TextStyle(
                                color: Colors.grey, // Grey text
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                            onPressed: () {
// Your onPressed logic for Technology here
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.grey), // Grey border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Circular border
                              ),
                            ),
                            child: Text(
                              'Technology',
                              style: TextStyle(
                                color: Colors.grey, // Grey text
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}

