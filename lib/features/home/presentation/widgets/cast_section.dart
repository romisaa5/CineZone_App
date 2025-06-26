import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/features/home/models/cast_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastSection extends StatelessWidget {
  final List<CastMember> cast;

  const CastSection({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cast', style: Styles.textStyle20),
        Column(
          children:
              cast.map((member) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    spacing: 15,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(member.image),
                        radius: 30,
                      ),

                      Expanded(
                        child: Column(
                          spacing: 3.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${member.name}',
                              style: Styles.textStyle16.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Character : ${member.character}',
                              style: Styles.textStyle14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
