import 'package:flutter/material.dart';

const String tmdb_image_url = 'https://image.tmdb.org/t/p/';
const String poster_size_185 = 'w185';
const String poster_size_342 = 'w342';
const String poster_size_500 = 'w500';
const String poster_size_1280 = 'w1280';


const List<String> mediaType = [
  "Movie",
  'TV',
  'Book',
  'Game'
];

double bodyMainWidthRatio = 1;
int listPageCount = 7;

Border testBorder = Border.all(color: Colors.red);
BoxDecoration testDec = BoxDecoration(
  border: testBorder
);

BorderRadius borderRadius4 = BorderRadius.circular(4);
BorderRadius borderRadius8 = BorderRadius.circular(8);
BorderRadius borderRadius12 = BorderRadius.circular(12);
BorderRadius borderRadius20 = BorderRadius.circular(20);
BorderRadius borderRadius30 = BorderRadius.circular(30);

const Radius radius12 = Radius.circular(12);
const Radius radius20 = Radius.circular(20);
const Radius radius30 = Radius.circular(30);

const EdgeInsets edgeInsetsAll20 = EdgeInsets.all(20);
const EdgeInsets edgeInsetsAll32 = EdgeInsets.all(32);
const EdgeInsets edgeInsetsAll8 = EdgeInsets.all(8);
const EdgeInsets edgeInsetsAll4 = EdgeInsets.all(4);
const EdgeInsets edgeInsetsAll12 = EdgeInsets.all(12);


// Color primaryColor = Color(0xFFE3E4F5);
const Color primaryColor = Color(0xFF181D23);
// Color accentColor = Color(0xFF191A1F);
// Color accentColor = Color(0xFF6AD8B7);
const Color accentColor = Color(0xFFF86D4E);
// Color primaryTextColor = Color(0xFFF5F5F6);
const Color primaryTextColor = Color(0xFFFFFFFF);
Color accentTextColor = Color(0xFFF5F5F5);
Color white = Colors.white;