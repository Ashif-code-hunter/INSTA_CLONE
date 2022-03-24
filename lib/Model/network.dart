import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:insta/Model/model_class.dart';


class NetworkHelper extends ChangeNotifier {
  String url = "https://li3bzg1xs9.execute-api.ap-south-1.amazonaws.com/default/getInstaPosts";
  int activeIndex=0;
  int selectTab=0;
  int postCount=0;
 Insta? post;

void getPosts() async{
    var response =await http.get(Uri.parse(url));
    if(response.statusCode==200){
      print(Insta.fromJson(jsonDecode(response.body)).posts[0].description);
      post= Insta.fromJson(jsonDecode(response.body));
   notifyListeners();
    }else{
      throw Exception("API IS NOT CALLRD SUCCESFULLY");
    }
  }

int  postLength() {
  print( post?.posts.length ?? 5);
   return post?.posts.length ?? 5;
  }

List postImages(int index){
    return post?.posts[index].images ?? [];
}

  String profImages(int index){
    return post?.posts[index].profileImage ?? "Nothing";
  }

  String names(int index){
    return post?.posts[index].postedBy ?? "Name";
  }

  String captions(int index){
    return post?.posts[index].description ?? "caption";
  }

  bool bookMark(int index){
    return post?.posts[index].interactions.bookmarked ?? false;
  }

  String countView(int index){
    return post?.posts[index].interactions.comments.toString() ?? "100";
  }

  String countLike(int index){
    return post?.posts[index].interactions.likes.toString() ?? "100";
  }





void activeIndexs(int index){
    activeIndex=index;
    notifyListeners();
}

void selectedTab(int index){
    selectTab = index;
    notifyListeners();
}
}