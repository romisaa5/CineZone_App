import 'package:cinezone_app/core/widgets/movie_card_item.dart';
import 'package:flutter/material.dart';
import 'package:cinezone_app/features/home/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isActive;
  final bool isSmall;

  const MovieCard({
    super.key,
    required this.movie,
    this.isActive = false,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final double width = isSmall ? 120 : 250;
    final double height = isSmall ? 160 : 350;
    final double radius = isSmall ? 12 : 20;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: isActive ? 0 : 20),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          if (!isSmall && isActive)
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
        ],
      ),
      child: MovieCardItem(movie: movie, isActive: isActive, isSmall: isSmall),
    );
  }
}
