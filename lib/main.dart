import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelverse_single_post_fetch/models/PostResponse.dart';
import 'package:travelverse_single_post_fetch/provider/PostProvider.dart';
import 'package:travelverse_single_post_fetch/screens/postScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //----------------------------
  @override
  void initState() {
    super.initState();

  }

  //----------------------------


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider (
            create: (context) => PostProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: PostScreen(),
      ),
    );
  }
}

