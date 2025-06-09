import 'package:cinezone_app/core/helper/validation_methods.dart';
import 'package:cinezone_app/core/widgets/custom_text_form_field.dart';
import 'package:cinezone_app/core/widgets/movie_card_item.dart';
import 'package:cinezone_app/features/home/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 10.h,
          children: [
            SizedBox(height: 20.h),
            AppTextFormField(
              hintText: 'search for movies, series, or people',
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              validator: (value) => ValidationMethods.validateUsername(value),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),

              itemBuilder: (context, index) {
                return MovieCardItem(
                  isSmall: false,
                  movie: Movie.movieList[index],
                  isActive: false,
                );
              },
              itemCount: Movie.movieList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
