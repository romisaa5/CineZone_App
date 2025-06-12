import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/widgets/movie_card_item.dart';
import 'package:cinezone_app/features/home/models/movie.dart';
import 'package:cinezone_app/features/profile/presentation/widgets/empty_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  static final List<String> movieCategory = [
    'Action',
    'Comedy',
    'Drama',
    'Romantic',
  ];

  String selectedGenre = movieCategory[0];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10.h,
          children: [
            SizedBox(height: 20.h),
            SizedBox(
              height: 45.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieCategory.length,
                itemBuilder: (context, index) {
                  final genre = movieCategory[index];
                  final isSelected = genre == selectedGenre;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenre = genre;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.h),
                      margin: EdgeInsets.all(8.h),
                      height: 30.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color:
                            isSelected
                                ? AppColors.yellowcolor
                                : Colors.grey[200],
                      ),
                      child: Center(
                        child: Text(
                          genre,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.grey[700],
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Movie.movieList.where((m) => m.genre == selectedGenre).isEmpty
                ? SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: Center(child: EmptySection()),
                )
                : GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      Movie.movieList
                          .where((m) => m.genre == selectedGenre)
                          .length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final filteredMovies =
                        Movie.movieList
                            .where((m) => m.genre == selectedGenre)
                            .toList();
                    return MovieCardItem(
                      isActive: false,
                      isSmall: false,
                      movie: filteredMovies[index],
                    );
                  },
                ),
          ],
        ),
      ),
    );
  }
}
