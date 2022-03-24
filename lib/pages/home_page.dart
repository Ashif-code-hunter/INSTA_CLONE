import 'package:flutter/material.dart';
import 'package:insta/theme/colors.dart';
import 'package:insta/widgets/story_item.dart';
import 'package:provider/provider.dart';
import '../widgets/post_item.dart';
import 'package:insta/Model/network.dart';
import 'package:insta/constants/story_links.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getBody(context);
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 15, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 65,
                        height: 65,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(profile),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 19,
                                  height: 19,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: white),
                                  child: const Icon(
                                    Icons.add_circle,
                                    color: buttonFollowColor,
                                    size: 19,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 70,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: white),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                    children: List.generate(stories.length, (index) {
                  return StoryItem(
                    img: stories[index]['img'],
                    name: stories[index]['name'],
                  );
                })),
              ],
            ),
          ),
          Divider(
            color: white.withOpacity(0.3),
          ),

          Column(
            children: List.generate(Provider.of<NetworkHelper>(context).postLength(), (index) {
              return PostItem(
                postImg: Provider.of<NetworkHelper>(context).postImages(index),
                profileImg:Provider.of<NetworkHelper>(context).profImages(index),
                name:Provider.of<NetworkHelper>(context).names(index),
                caption:Provider.of<NetworkHelper>(context).captions(index),
                isLoved: Provider.of<NetworkHelper>(context).bookMark(index),
                viewCount: Provider.of<NetworkHelper>(context).countView(index),
                likedBy:  "Rohan",
                dayAgo: "5",
                likeCount: Provider.of<NetworkHelper>(context).countLike(index),
              );
            }),
          )
        ],
      ),
    );
  }


}
