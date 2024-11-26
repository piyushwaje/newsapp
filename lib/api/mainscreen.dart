import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsapp/api/viewmodel.dart';

import '../newssetails.dart';
import 'newsapi.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  viewmodel view = viewmodel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<newsapi>(
        future: view.fetchNews(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitCircle(
                size: 50,
                color: Colors.blue,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.articles?.length,
              itemBuilder: (context, index) {
                String imageUrl = Uri.decodeFull(
                    snapshot.data?.articles?[index].urlToImage ?? '');
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              SpinKitCircle(size: 50, color: Colors.blue),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.image),
                        ),
                        TextButton(onPressed: (){

                          String author =snapshot.data?.articles?[index].author as String;
                          String title = snapshot.data?.articles?[index].title as String;
                          String description = snapshot.data?.articles?[index].description as String;

                          String urlToImage = imageUrl;
                          String publishedAt = snapshot.data?.articles?[index].publishedAt as String;
                          String content = snapshot.data?.articles?[index].content as String;

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => newsdetails(author,title,description,urlToImage,publishedAt,content)),
                          );
                        }, child: Text(snapshot.data?.articles![index].title?? ''))

                      ],
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}
