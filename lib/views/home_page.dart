import 'package:assignment_app/services/remote_services.dart';
import "package:flutter/material.dart";
import '../models/news.dart';
import 'blog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<News>? news;
  List<Article> article = new List.empty(growable: true);
  var isLoaded = false;
  //bool _loading = true;

  @override
  void initState() {
    super.initState();
    getData();
    //fetch data from API
  }

  getData() async {
    RemoteServices newsClass = RemoteServices();
    await newsClass.getNews();
    article = newsClass.news;
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "H E A D L I N E S",
          style: TextStyle(
            fontSize: 19,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(70, 70, 70, 1),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Visibility(
            visible: isLoaded,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
                itemCount: article.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Blog(
                      article[index].urlToImage,
                      article[index].title,
                      article[index].author,
                      article[index].publishedAt,
                      article[index].description);
                }),
          ),
        ),
      ),
    );
  }
}
