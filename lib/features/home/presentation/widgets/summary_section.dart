import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class SummarySection extends StatelessWidget {
  final String summary;

  const SummarySection({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Summary', style: Styles.textStyle20),
        const SizedBox(height: 8),
        Text(summary, style: Styles.textStyle14),
      ],
    );
  }
}
