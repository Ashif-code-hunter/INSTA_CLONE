// To parse this JSON data, do
//
//     final insta = instaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Insta instaFromJson(String str) => Insta.fromJson(json.decode(str));

String instaToJson(Insta data) => json.encode(data.toJson());

class Insta {
  Insta({
    required this.status,
    required this.message,
    required this.posts,
  });

  int status;
  String message;
  List<Post> posts;

  factory Insta.fromJson(Map<String, dynamic> json) => Insta(
    status: json["status"],
    message: json["message"],
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    required this.images,
    required this.description,
    required this.interactions,
    required this.postedBy,
    required this.profileImage,
  });

  List<String> images;
  String description;
  Interactions interactions;
  String postedBy;
  String profileImage;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    images: List<String>.from(json["images"].map((x) => x)),
    description: json["description"],
    interactions: Interactions.fromJson(json["interactions"]),
    postedBy: json["postedBy"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images.map((x) => x)),
    "description": description,
    "interactions": interactions.toJson(),
    "postedBy": postedBy,
    "profileImage": profileImage,
  };
}

class Interactions {
  Interactions({
    required this.likes,
    required this.comments,
    required this.bookmarked,
  });

  int likes;
  int comments;
  bool bookmarked;

  factory Interactions.fromJson(Map<String, dynamic> json) => Interactions(
    likes: json["likes"],
    comments: json["comments"],
    bookmarked: json["bookmarked"],
  );

  Map<String, dynamic> toJson() => {
    "likes": likes,
    "comments": comments,
    "bookmarked": bookmarked,
  };
}





