// app.quicktype.io
// (changes json into dart class)

import 'package:flutter/cupertino.dart';

class PostResponse with ChangeNotifier {
  PostResponse({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.images,
    this.latitude,
    this.longitude,
    this.likes,
    this.comments,
    this.shares,
    this.isSharedPost,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.sharedPostId,
  });

  String id;
  String userId;
  String title;
  String description;
  List<String> images;
  double latitude;
  double longitude;
  List<String> likes;
  List<Comment> comments;
  List<dynamic> shares;
  bool isSharedPost;
  DateTime date;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String sharedPostId;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
    id: json["_id"],
    userId: json["userId"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    likes: List<String>.from(json["likes"].map((x) => x)),
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    shares: List<dynamic>.from(json["shares"].map((x) => x)),
    isSharedPost: json["isSharedPost"],
    date: DateTime.parse(json["date"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    sharedPostId: json["sharedPostId"] == null ? null : json["sharedPostId"],
  );

}

class Comment {
  Comment({
    this.user,
    this.postId,
    this.desc,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String user;
  String postId;
  String desc;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    user: json["user"],
    postId: json["postId"],
    desc: json["desc"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

}
