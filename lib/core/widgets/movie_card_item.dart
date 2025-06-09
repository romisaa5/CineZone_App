import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/features/home/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCardItem extends StatelessWidget {
  const MovieCardItem({
    super.key,
    required this.movie,
    required this.isActive,
    required this.isSmall,
  });
  final Movie movie;
  final bool isActive;
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    final double ratingFontSize = isSmall ? 10 : 12;
    final double starSize = isSmall ? 12 : 14;
    final double radius = isSmall ? 12 : 20;
    final double width = isSmall ? 120 : 250;
    final double height = isSmall ? 160 : 350;
    return Stack(
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
                Icon(Icons.star, color: AppColors.yellowcolor, size: starSize),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
