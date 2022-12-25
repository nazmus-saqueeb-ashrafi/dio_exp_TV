import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:travelverse_single_post_fetch/models/PostResponse.dart';
import 'package:travelverse_single_post_fetch/provider/PostProvider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    print("build all widgets");
    return Scaffold(
      appBar: AppBar(
        title: Text("Single post fetch"),
      ),
      body: Column(
        children: [
          
          Consumer<PostProvider>(
            builder: (context,value,child){
              print("only build post data widget");
              return postProvider.showPostData();
            },
          ),
          Text("----------Addidtional info----------"),
          Consumer<PostProvider>(
            builder: (context,value,child){
              print("only build like data widget");
              return Text("Likes:"+postProvider.likeCount.toString());
            },
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          postProvider.addLikes();
          // notice how when pressed, widgets under Consumers are rebuild,
          // but all widgets are not rebuild
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
