import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travelverse_single_post_fetch/screens/DioSample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DioSample(),
    );
  }
}

// class SinglePostPage extends StatefulWidget {
//   const SinglePostPage({Key key}) : super(key: key);
//
//   @override
//   State<SinglePostPage> createState() => _SinglePostPageState();
// }
//
// class _SinglePostPageState extends State<SinglePostPage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Single Post Page"),
//       ),
//       body: FutureBuilder(
//         future: PostApiServices().fetchPost(),
//         builder: (context, snapshot){
//           if(!snapshot.hasData){
//             // print(snapshot);
//             return Center(child: CircularProgressIndicator(),);
//           }else if(snapshot.hasError){
//             return Center(child: Text("ERROR"));
//           }else{
//             return Center(child: Text(snapshot.data));
//           }
//         },
//       ),
//     );
//   }
// }

