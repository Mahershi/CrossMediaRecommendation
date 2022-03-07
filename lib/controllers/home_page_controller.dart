import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/genre_repo.dart' as gr;

class HomePageController extends ControllerMVC{
  bool genreLoaded = false;

  Future<void> initialDataFetch() async{
    await gr.fetchMovieTvGenres();
    setState(() {
      genreLoaded = true;
    });
  }
}