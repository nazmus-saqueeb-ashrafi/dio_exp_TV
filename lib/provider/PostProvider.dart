import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Dio/http_service.dart';
import '../models/PostResponse.dart';

class PostProvider with ChangeNotifier{

  PostResponse postResponse;
  int likeCount = 0; // used to show power of consumer

  Future<PostResponse> getPostData() async {
    try {
      Response response =
      await DioClient().get('/post/632c79d095ce7d9364e088f8/posts');

      if (response.statusCode == 200) {
        postResponse = PostResponse.fromJson(response.data[0]);

        //[0] because response in an array of maps
        // print("RESPONSE");
        // print(postResponse);

        return postResponse;
      }
    } on DioError catch (e) {
      print(e);
    }

    // notifyListeners();

  }


  FutureBuilder<PostResponse> showPostData() {
    // notifyListeners();

    return FutureBuilder<PostResponse>(
      future: getPostData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print(snapshot);
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("ERROR"));
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                snapshot.data.title.toString(),
              ),
              Text(
                snapshot.data.description.toString(),
              ),
            ],
          );
        }
      },
    );

  }

  void addLikes(){
    likeCount++;
    notifyListeners();
  }


}

