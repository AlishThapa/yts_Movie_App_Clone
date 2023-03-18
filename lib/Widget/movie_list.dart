import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/app_bloc.dart';
import '../Models/MainScreenModals/movie_details.dart';
import '../Screen/movie_detail_screen.dart';

class MovieList extends StatefulWidget {
  const MovieList({
    super.key,
  });

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppBloc, Data>(
      builder: (context, state) => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.99,
          mainAxisSpacing: 11,
          crossAxisSpacing: 11,
        ),
        itemBuilder: (context, index) {
          return state.movies.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetail(
                          movieTitle: state.movies[index].title,
                          movieYear: state.movies[index].year,
                          movieGenre: state.movies[index].genre,
                          movieImage: state.movies[index].largeCoverImage,
                          movieRating: state.movies[index].rating,
                          movieRuntime: state.movies[index].runtime,
                          movieSummary: state.movies[index].summary,
                          //milauna baki movieSize
                          movieSize: state.movies[index].summary,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 145,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(state.movies[index].largeCoverImage, fit: BoxFit.cover),
                      ),
                      Text(
                        state.movies[index].title,
                        style: const TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        state.movies[index].year.toString(),
                        style: const TextStyle(color: Color(0xff868584)),
                      ),
                    ],
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
