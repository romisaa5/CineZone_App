import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/widgets/custom_button.dart';
import 'package:cinezone_app/features/home/models/movie.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                movie.image,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: .3),
                      Colors.black.withValues(alpha: .5),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 20,
                child: Align(
                  alignment: Alignment.bottomCenter,

                  child: Text(
                    movie.title,
                    style: Styles.textStyle32,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                CustomButton(
                  textcolor: Colors.white,
                  isborder: false,
                  text: 'Watch',
                  color: AppColors.redcolor,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
