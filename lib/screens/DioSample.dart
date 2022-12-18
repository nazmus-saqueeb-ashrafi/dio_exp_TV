import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../dioEasyAp/http_service.dart';

class DioSample extends StatefulWidget {
  const DioSample({Key key}) : super(key: key);

  @override
  State<DioSample> createState() => _DioSampleState();
}

class _DioSampleState extends State<DioSample> {
  
  void getHttp() async {
    try {
      var response = await Dio().get('https://travelverse-mobile-server.onrender.com/post/632c79d095ce7d9364e088f8/posts');
      print(response);
    } catch (e) {
      print(e);
    }
  }
  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // HttpService httpService;
    //
    // httpService.getHttpOriginal();

  }
  
  @override
  Widget build(BuildContext context) {
    // getHttp();

    HttpService httpService;

    httpService.getHttpOriginal();

    // try {
    //   Future getPost() async {
    //     Response response = await httpService.getHttp(
    //         '/post/632c79d095ce7d9364e088f8/posts');
    //
    //     if(response.statusCode==200){
    //       print("clean");
    //     }
    //
    //     if(response.data!=null){
    //       print("bad null");
    //     }else{
    //       print("object jjjs");
    //     }
    //
    //   }
    //   getPost();
    // }catch(e){
    //   print(e);
    // }



    return Container();
  }
}

