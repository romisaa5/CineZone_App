import 'package:cinezone_app/core/widgets/movie_card_item.dart';
import 'package:cinezone_app/features/home/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({super.key, required this.movies});
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0.h),
      child: GridView.builder(
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return MovieCardItem(
            movie: movies[index],
            isActive: false,
            isSmall: true,
          );
        },
      ),
    );
  }
}
