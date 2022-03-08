import 'package:cross_media_recommendation/network/rest_service.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:http/http.dart' as http;


Future<dynamic> getTopMovieForGenre({limit = 25, genre}) async {
  var qp = {
    'limit': limit,
  };
  if(genre != null){
    qp['genre'] = genre;
  }

  var data = RestService.request(
    endpoint: API.top_movies,
    queryParams: qp,
  );

  return data;
}

Future<dynamic> getMovieDetail(String id) async{
  var data = RestService.request(
    endpoint: API.movies + '/' + id
  );
  return data;
}

Future<dynamic> getRecommendations(String id) async{
  var qp = {
    'movie_id': id,
  };
  var data = RestService.request(
    endpoint: API.movie_recommendations,
    queryParams: qp
  );
  return data;
}