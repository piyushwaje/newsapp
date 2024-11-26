import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newsdetails extends StatefulWidget {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;
  const newsdetails(this.author, this.title, this.description, this.urlToImage,
      this.publishedAt, this.content,
      {super.key});

  @override
  State<newsdetails> createState() => _newsdetailsState();
}

class _newsdetailsState extends State<newsdetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue, // Optional: set the app bar background color
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the button is pressed
          },
        ),
        elevation: 0, // Optional: remove the shadow
      ),
      body: Center(
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.9,

                child:Image.network(
                  widget.urlToImage,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Show the image once it's fully loaded
                    } else {
                      return Center(
                          child:
                          CircularProgressIndicator()); // Show a loading indicator while the image loads
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                        Icons.error); // Show an error icon if the image fails to load
                  },
                ) ,
              ),
          // You can replace this URL with your image URL
              SizedBox(height: 20), // Adds space between image and title
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.publishedAt,
                style: TextStyle(
                  fontSize: 18,

                ),
              ),// Adds space between title and description
              SizedBox(height: 10),

              Text(
                "Author: " + widget.author,
                style: TextStyle(
                  fontSize: 18,

                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                widget.content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
