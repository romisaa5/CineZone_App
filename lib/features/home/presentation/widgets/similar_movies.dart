import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/widgets/movie_card_item.dart';
import 'package:cinezone_app/features/home/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarMovies extends StatelessWidget {
  final Movie currentMovie;
  const SimilarMovies({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    final List<Movie> similarMovies =
        Movie.movieList
            .where(
              (movie) =>
                  movie.genre == currentMovie.genre &&
                  movie.title != currentMovie.title,
            )
            .take(4)
            .toList();
    final double gridHeight = similarMovies.length <= 2 ? 275.h : 550.h;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text('Similar', style: Styles.textStyle20),
        ),
        SizedBox(
          height: gridHeight,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: similarMovies.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return MovieCardItem(
                isSmall: false,
                isActive: false,
                movie: similarMovies[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
