import 'package:assignment_app/services/remote_services.dart';
import "package:flutter/material.dart";
import '../models/news.dart';
import 'blog.dart';

class Description extends StatefulWidget {
  String? imageUrl, title, author, publishedAt, desc;
  Description(@required this.imageUrl, @required this.title, this.author,
      this.publishedAt, this.desc);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  List<Article> article = new List.empty(growable: true);
  var isLoaded = false;

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
            "D E S C R I P T I O N",
            style: TextStyle(
              fontSize: 19,
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 0, 0, 0.4),
              Color.fromRGBO(0, 0, 0, 0.9)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Ink.image(
                image: NetworkImage(widget.imageUrl!),
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {},
                )),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.title!,
                  style: const TextStyle(
                    fontFamily: "Roboto Slab",
                    fontWeight: FontWeight.bold,
                    fontSize: 29,
                    color: Color.fromRGBO(242, 242, 242, 1),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.author ?? "Unknown",
                      style: const TextStyle(
                        fontFamily: "Roboto Slab",
                        fontSize: 20,
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                    ),
                    Text(
                      "${DateTime.parse(widget.publishedAt!).year.toString()} - ${DateTime.parse(widget.publishedAt!).month.toString()} - ${DateTime.parse(widget.publishedAt!).day.toString()}",
                      style: const TextStyle(
                        fontFamily: "Roboto Slab",
                        fontSize: 20,
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.desc!,
                  style: const TextStyle(
                    fontFamily: "Roboto Slab",
                    fontSize: 14,
                    color: Color.fromRGBO(186, 186, 186, 1),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
