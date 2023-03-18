import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/MainScreenModals/movie_details.dart';

class AppBloc extends Cubit<Data> {
  AppBloc() : super(Data(movies: [], isData: false)){
    getMediaList();
  }

  void getMediaList() async {
    emit(Data(movies: [], isData: true));
    var response = await Dio().get('https://yts.mx/api/v2/list_movies.json');
    List<Movies> movie = (response.data["data"]["movies"] as List).map((e) => Movies.fromJson(e)).toList();
    movie.shuffle();
    emit(Data(movies: movie));
  }
}
