import 'package:flutter/material.dart';
import 'package:cinezone_app/features/home/models/movie.dart';
import 'movie_card.dart';
import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';

class MovieCategorySection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback? onSeeMore;

  const MovieCategorySection({
    super.key,
    required this.title,
    required this.movies,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (onSeeMore != null)
                TextButton(
                  onPressed: onSeeMore,
                  child: Text(
                    'See More →',
                    style: Styles.textStyle14.copyWith(
                      color: AppColors.yellowcolor,
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCard(movie: movies[index], isSmall: true);
            },
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
