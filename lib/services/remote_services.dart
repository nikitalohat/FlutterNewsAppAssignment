import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import '../models/news.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  List<Article> news = [];

  Future<void> getNews() async {
    var client = http.Client();
    var uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2022-11-18&sortBy=publishedAt&apiKey=f94742bea2a84da5a0b1fee5df191d01");
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          Article article = Article(
              author: element["author"],
              title: element["title"],
              description: element["description"],
              urlToImage: element["urlToImage"],
              content: element["content"],
              publishedAt: element["publishedAt"]);
          news.add(article);
        }
      });
    }
  }
}
