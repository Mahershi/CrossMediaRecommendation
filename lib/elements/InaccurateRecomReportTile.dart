import 'package:cross_media_recommendation/controllers/inaccurate_recom_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../helper/constants.dart';
import '../models/reports_models/inaccurate_recom_model.dart';
import 'CustomSpacer.dart';

class InaccurateRecomReportTile extends StatefulWidget{
  InaccurateRecomModel? object;
  InaccurateRecomReportTile({Key? key, required this.object}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<InaccurateRecomReportTile>{
  InaccurateRecomController? con;

  PageState() : super(InaccurateRecomController()){
    con = controller as InaccurateRecomController;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: edgeInsetsAll12,
        // decoration: testDec,
        decoration: BoxDecoration(
            color: white.withOpacity(0.2),
            borderRadius: borderRadius4
        ),
        margin: EdgeInsets.symmetric(vertical: 8),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    // decoration: testDec,
                    child: Text(
                      "#" + widget.object!.title!,
                      style: TextStyle(
                          color: primaryTextColor.withOpacity(0.7),
                          fontSize: 14,
                          letterSpacing: 1.01
                      ),
                    ),
                  ),
                  CustomSpacer(),
                  Expanded(
                    child: Container(
                      // decoration: testDec,
                      child: Text(
                        widget.object!.name!,
                        style: TextStyle(
                            color: primaryTextColor.withOpacity(0.7),
                            fontSize: 14,
                            letterSpacing: 1.01
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(width: 50,),
                  Expanded(
                    child: Container(
                      // decoration: testDec,
                      child: Text(
                        widget.object!.recommendedName!,
                        style: TextStyle(
                            color: primaryTextColor.withOpacity(0.7),
                            fontSize: 14,
                            letterSpacing: 1.01
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(width: 50,),

                ],
              ),
            ),
            Container(
              // decoration: testDec,
              child: Row(
                children: [
                  // Container(
                  //   // decoration: testDec,
                  //   child: Text(
                  //     widget.object!.createdDate!.substring(0, 10),
                  //     style: TextStyle(
                  //         color: primaryTextColor.withOpacity(0.7),
                  //         fontSize: 14,
                  //         letterSpacing: 1.01
                  //     ),
                  //   ),
                  // ),
                  // CustomSpacer(width: 150,),
                  Tooltip(
                    message: "Number of Reports",
                    child: Container(
                      // decoration: testDec,
                      child: Text(
                        widget.object!.count!.toString(),
                        style: TextStyle(
                            color: primaryTextColor.withOpacity(0.7),
                            fontSize: 14,
                            letterSpacing: 1.01
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(width: 150,),
                  Tooltip(
                    message: "Remove from Recommendations",
                    child: InkWell(
                      onTap: (){
                        con!.markAsDone(reportId: widget.object!.id!);
                      },
                      child: Container(
                        // decoration: testDec,
                        child: Text(
                          'Remove',
                          style: TextStyle(
                              color: accentColor,
                              fontSize: 14,
                              letterSpacing: 1.01
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        )
    );
  }
}