// lib/features/home/widgets/movie_card.dart

import 'package:cinezone_app/core/theme/app_colors.dart';
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
    final double ratingFontSize = isSmall ? 10 : 12;
    final double starSize = isSmall ? 12 : 14;

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
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Image.asset(
              movie.image,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    movie.rating.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ratingFontSize,
                    ),
                  ),
                  SizedBox(width: 3),
                  Icon(
                    Icons.star,
                    color: AppColors.yellowcolor,
                    size: starSize,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
