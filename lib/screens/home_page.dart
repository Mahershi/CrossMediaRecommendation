import 'package:cross_media_recommendation/controllers/home_page_controller.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/screens/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'AdminBodyMain.dart';
import 'BodyMain.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class HomePage extends StatefulWidget{
  @override
  PageState createState () => PageState();
}

class PageState extends StateMVC<HomePage>{
  HomePageController? con;

  PageState() : super(HomePageController()){
    con = controller as HomePageController;
    gr.homePageController = con;
  }

  @override
  void initState(){
    super.initState();
    // // print"Home init");
    con!.initialDataFetch();
  }

  // might be called twice leading to issues with BodyMain Unique Key
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: ur.loggedIn || ur.isGuest ? Row(
          children: [
            // Container(
            //   padding: edgeInsetsAll32,
            //   // margin: EdgeInsets.symmetric(vertical: 20),
            //   width: MediaQuery.of(context).size.width * 0.18,
            //   decoration: BoxDecoration(
            //     // borderRadius: BorderRadius.only(topLeft: radius30,),
            //     border: Border(right: BorderSide(color: primaryColor.withOpacity(0.6), width: 0.1)),
            //     color: primaryColor,
            //   ),
            //   child: HomeSidePane(),
            // ),
            Container(
              width: MediaQuery.of(context).size.width * bodyMainWidthRatio,
              color: primaryColor,
              child: con!.genreLoaded ? BodyMain(key: UniqueKey(),) : Text("Genre Loading"),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width * bodyMainWidthRation,
            //   color: primaryColor,
            //   child: Stack(
            //     children: [
            //       SingleChildScrollView(
            //         child: con!.genreLoaded ? BodyMain() : Text("Genre Loading"),
            //       ),
            //       Container(
            //         // decoration: testDec,
            //           padding: edgeInsetsAll20,
            //           // decoration: testDec,
            //           child: TopNav()
            //       ),
            //
            //     ],
            //   ),
            // ),
          ],
        ) : LoginPage(),
      ),
    );
  }
}