import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:travelverse_single_post_fetch/extra/model/PostResponse.dart';
import '../dioEasyAp/http_service.dart';

class DioSample extends StatefulWidget {
  const DioSample({Key key}) : super(key: key);

  @override
  State<DioSample> createState() => _DioSampleState();
}

class _DioSampleState extends State<DioSample> {
  @override
  void initState() {
    super.initState();

    getPost();

  }

  Future<PostResponse> getPost() async {
    try {
      Response response =
          await DioClient().get('/post/632c79d095ce7d9364e088f8/posts');

      if (response.statusCode == 200) {
        PostResponse postResponse = PostResponse.fromJson(response.data[0]);
        //[0] because response in an array of maps
        print("RESPONSE");
        print(postResponse);
        // return postResponse.title.toString();
        return postResponse;
      }
    } on DioError catch (e) {
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single post fetch"),
      ),
      body: FutureBuilder<PostResponse>(
        future: getPost(),
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
      ),
    );
  }
}
