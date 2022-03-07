import 'package:cross_media_recommendation/elements/ItemTile.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/basic_movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:cross_media_recommendation/repositories/global_var_repo.dart';

class ItemList extends StatefulWidget{
  List<dynamic> listData;
  ItemScrollController scrollController;

  ItemList({Key? key, required this.scrollController, required this.listData}) : super(key: key);
  @override
  PageState createState () => PageState();
}

class PageState extends State<ItemList>{
  int count = 13;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.28,
      child: ScrollablePositionedList.builder(
        itemScrollController: widget.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: count,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index){
          return Container(
            width: (MediaQuery.of(context).size.width * 0.62 - 64 - 64) / 5,
              margin: index == 0 ? EdgeInsets.only(right: 8, top: 8, bottom: 8) : index == count-1 ? EdgeInsets.only(left: 8, top:8, bottom: 8) : edgeInsetsAll8,
              child: ItemTile(parentWidth: (MediaQuery.of(context).size.width * 0.62 - 64 - 64) / 5, index: index)
          );
        },
      ),
    );
  }
}
