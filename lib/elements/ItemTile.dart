import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_media_recommendation/controllers/item_tile_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/helper/FToastHelper.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/basic_movie_model.dart';
import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:mvc_pattern/mvc_pattern.dart';

class ItemTile extends StatefulWidget{
  double parentWidth;
  double parentHeight;
  BasicTitleModel titleModel;
  bool showReportButton;
  ItemTile({Key? key, required this.parentWidth, required this.titleModel, this.showReportButton = false, required this.parentHeight}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<ItemTile>{
  ItemTileController? con;

  PageState() : super(ItemTileController()){
    con = controller as ItemTileController;
  }

  @override
  void initState(){
    super.initState();
    con!.basicTitleModel = widget.titleModel;
  }

  @override
  Widget build(BuildContext context) {
    // // print"Rebuild tile");
    // printcon!.basicTitleModel!.user_rating!);
    return Stack(
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                gr.currentTitle = con!.basicTitleModel;
                // gr.bodyMainController!.switchPage(2, data: con!.basicTitleModel);
                Navigator.of(context).pushNamed('/TitleDescription', arguments: con!.basicTitleModel);
              },
              child: ClipRRect(
                borderRadius: borderRadius12,
                child: CachedNetworkImage(
                  imageUrl: con!.basicTitleModel!.title_type == 3
                  ? con!.basicTitleModel!.poster_path!
                  : tmdb_image_url + poster_size_342 + con!.basicTitleModel!.poster_path!,
                  width: widget.parentWidth,
                  height: widget.parentHeight,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            ur.loggedIn ? CustomSpacer(height: 10,) : CustomSpacer(height: 0,),
            ur.loggedIn ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: con!.like,
                      child: Icon(
                        con!.basicTitleModel!.user_rating == 5 ? Icons.thumb_up_alt_rounded : Icons.thumb_up_off_alt_outlined,
                        color: con!.basicTitleModel!.user_rating == 5 ? Colors.green.withOpacity(0.7) : primaryTextColor.withOpacity(0.3),
                      ),
                    ),
                    CustomSpacer(width: 10,),
                    InkWell(
                      onTap: con!.dislike,
                      child: Icon(
                        con!.basicTitleModel!.user_rating == 1 ? Icons.thumb_down_alt_rounded : Icons.thumb_down_off_alt_outlined,
                        color: con!.basicTitleModel!.user_rating == 1 ? accentColor.withOpacity(0.9) : primaryTextColor.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
                widget.showReportButton
                    ? Tooltip(
                      message: "Report inaccurate Recommendation",
                      child: InkWell(
                          onTap: () async {
                            // print"inaccurate recomm");
                            con!.reportInaccurateRecommendation().then((value){
                              if(value){
                                CustomToast(msg: "Recommendation reported as Inaccurate", context: context).showToast();
                              }else{
                                CustomToast(msg: "An Error Occured!", context: context).showToast();
                              }
                            });

                          },
                            child: Icon(Icons.remove_circle_outline, color: primaryTextColor.withOpacity(0.7),)
                        ),
                    )
                    : SizedBox(height: 0,)
              ],
            ) : Container(height: 0,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Image.asset(
            //           'assets/img/like.png',
            //           height: 20,
            //           width: 20,
            //           color: white,
            //         ),
            //         CustomSpacer(width: 10,),
            //         Image.asset(
            //           'assets/img/dislike.png',
            //           height: 20,
            //           width: 20,
            //           color: white
            //         )
            //       ],
            //     ),
            //     Image.asset(
            //       'assets/img/report.png',
            //       height: 20,
            //       width: 20,
            //       color: white,
            //     ),
            //   ],
            // )
            // SizedBox(height: 20,),
            // Flexible(
            //   child: Text(
            //     con!.basicTitleModel.title!,
            //     style: Theme.of(context).textTheme.headline5,
            //     maxLines: 2,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // )
          ],
        ),
        Visibility(
          visible: ur.loggedIn,
          child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: (){
                con!.toggleWishList();
              },
              child: Container(
                margin: edgeInsetsAll12,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: con!.basicTitleModel!.added! ? primaryColor : primaryTextColor,
                  borderRadius: borderRadius8
                ),
                child: Icon(
                  con!.basicTitleModel!.added! ? Icons.done : Icons.add,
                  color: con!.basicTitleModel!.added! ? primaryTextColor : accentColor,
                  size: 20,
                )
              ),
            ),
          ),
        )
      ],
    );
  }
}