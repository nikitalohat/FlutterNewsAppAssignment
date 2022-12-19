import 'views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
          fontFamily: 'Roboto Slab',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.black,
          )),
      home: const HomePage(),
    );
  }
}
