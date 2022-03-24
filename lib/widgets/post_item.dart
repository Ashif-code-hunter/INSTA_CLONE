import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:expandable_text/expandable_text.dart';
import '../theme/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:insta/Model/network.dart';
class PostItem extends StatelessWidget {
  final String profileImg;
  final String name;
  final List postImg;
  final String caption;
  final bool isLoved;
  final String likedBy;
  final String viewCount;
  final String dayAgo;
  final String likeCount;
   PostItem(
      {
      required this.profileImg,
      required this.name,
      required this.postImg,
       required this.isLoved,
      required this.likedBy,
      required this.viewCount,
      required this.dayAgo,
      required this.caption,
      required this.likeCount});



  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    activeIndex = Provider.of<NetworkHelper>(context).activeIndex;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(profileImg),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(black),
                      ),
                      child: const Text(
                        "Follow",
                      ),
                    ),
                    const Icon(
                      LineIcons.verticalEllipsis,
                      color: white,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: CarouselSlider.builder(
              itemCount: postImg.length,
              options: CarouselOptions(
                  height: 400,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    Provider.of<NetworkHelper>(context,listen: false).activeIndexs(index);
                  }),
              itemBuilder: (context, index, realindex) {
                final urlImage = postImg[index];
                return buildImage(urlImage, index);
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    isLoved
                        ? SvgPicture.asset(
                            "assets/images/loved_icon.svg",
                            width: 27,
                          )
                        : SvgPicture.asset(
                            "assets/images/love_icon.svg",
                            width: 27,
                          ),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      "assets/images/comment_icon.svg",
                      width: 27,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      "assets/images/message_icon.svg",
                      width: 27,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    buildIndicator()
                  ],
                ),
                isLoved
                    ? SvgPicture.asset(
                  "assets/images/bookmarked.svg",
                  width: 27,
                )
                    : SvgPicture.asset(
                  "assets/images/bookmark.svg",
                  width: 27,
                ),




              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "Liked by ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              TextSpan(
                  text: "${likedBy} ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              const TextSpan(
                  text: "and ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              TextSpan(
                  text: "${likeCount} ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              const TextSpan(
                  text: "Other",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            ])),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${name} ",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ExpandableText(
                        caption,
                          expandText: 'show more',
                          collapseText: 'show less',
                          maxLines: 1,
                          linkColor: Colors.grey,
                          style: TextStyle(color: white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "$dayAgo day ago",
              style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        //margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator()=> AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: postImg.length,
      effect: const ScrollingDotsEffect(
      dotHeight: 5,
    dotWidth: 5
  ),
  );
}
