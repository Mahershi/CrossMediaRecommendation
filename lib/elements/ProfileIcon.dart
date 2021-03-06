import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

class ProfileIcon extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<ProfileIcon>{
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 50,
        maxHeight: 60,
        // maxWidth: 80
      ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          // decoration: BoxDecoration(
          //   border: Border.all(color: accentColor),
          //   borderRadius: BorderRadius.circular(100)
          // ),
          padding: EdgeInsets.all(4),
          // child: ClipRRect(
          //   borderRadius: BorderRadius.circular(100),
          //   child: CachedNetworkImage(
          //     imageUrl: ur.currentUser!.image_url!,
          //     httpHeaders: {
          //       'Access-Control-Allow-Origin': '*'
          //     },
          //   )
          // ),
          child: Image.asset(
            'assets/img/user.png',
            color: accentColor,
          ),
      ),
    );
  }
}