// import 'package:dioEasyAp/dioEasyAp.dart';
// import 'package:travelverse_single_post_fetch/model/PostResponse.dart';
//
// class PostApiServices {
//   String _url = 'https://travelverse-mobile-server.onrender.com/post/632c79d095ce7d9364e088f8/posts';
//
//   Dio _dio;
//   PostApiServices() {
//     _dio = Dio();
//   }
//
//   Future fetchPost() async{
//     try{
//       Response response = await _dio.get(_url);
//       PostResponse postResponse = PostResponse.fromJson(response.data);
//       return postResponse.title;
//
//     }on DioError catch (e){
//       print(e);
//       throw Exception(e.message);
//     }
//   }
//
// }