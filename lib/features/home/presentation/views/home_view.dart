import 'package:cinezone_app/features/home/presentation/manager/cubit/movie_cubit.dart';
import 'package:cinezone_app/features/home/presentation/widgets/movie_card.dart';
import 'package:cinezone_app/features/home/presentation/widgets/movie_category_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinezone_app/features/home/models/movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  final FocusNode _focusNode = FocusNode();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = Movie.movieList;

    return Scaffold(
      backgroundColor: Colors.black,
      body: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: (event) {
          if (event is KeyDownEvent) {
            final cubit = context.read<MovieCubit>();
            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              cubit.next(movies.length);
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              cubit.previous();
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }
        },
        child: BlocBuilder<MovieCubit, int>(
          builder: (context, currentIndex) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: Container(
                          key: ValueKey<String>(movies[currentIndex].image),
                          height: MediaQuery.of(context).size.height * .75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(movies[currentIndex].image),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withValues(alpha: .6),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Center(
                              child: Image.asset(
                                'assets/images/available_now.png',
                                height: 80.h,
                              ),
                            ),
                            SizedBox(
                              height: 300,
                              child: PageView.builder(
                                controller: _pageController,
                                itemCount: movies.length,
                                onPageChanged: (index) {
                                  context.read<MovieCubit>().setIndex(index);
                                },
                                itemBuilder: (context, index) {
                                  final isActive = index == currentIndex;
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: isActive ? 0 : 10,
                                    ),
                                    child: MovieCard(
                                      movie: movies[index],
                                      isActive: index == currentIndex,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Image.asset(
                              'assets/images/watch_now.png',
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  MovieCategorySection(
                    title: 'Action',
                    movies:
                        Movie.movieList
                            .where((m) => m.genre == 'Action')
                            .toList(),
                    onSeeMore: () {},
                  ),
                   MovieCategorySection(
                    title: 'Comedy',
                    movies:
                        Movie.movieList
                            .where((m) => m.genre == 'Comedy')
                            .toList(),
                    onSeeMore: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
