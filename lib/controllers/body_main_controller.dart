import 'package:cross_media_recommendation/elements/SearchResults.dart';
import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:cross_media_recommendation/screens/MyWishlistScreen.dart';
import 'package:cross_media_recommendation/screens/TitleDescription.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/search_repo.dart' as sr;

import '../screens/MovieScreen.dart';
import '../screens/TvScreen.dart';


class BodyMainController extends ControllerMVC{
  Widget? bodyWidget;
  List<String> tabs = ['Movies', 'Shows', 'My List'];
  bool showSidePane = false;

  void switchPage(int index, {dynamic? data}){
    // print"Switching: ");
    switch(index){
      case 0:
        bodyWidget = MovieScreen();
        break;
      // case 3:
      //   bodyWidget = SearchResults(search_results_data: search_results!['data'],);
      //   break;
      case 2:
        bodyWidget = MyWishListScreen();
        break;
      case 1:
        bodyWidget = TvScreen();
        break;
    }
    setState(() {
    });
  }

  void toggleSidePane(){
    setState(() {
      showSidePane = !showSidePane;
    });
  }





}