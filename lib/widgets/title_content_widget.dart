import 'package:flutter/material.dart';

import '../themes/app_textstyles.dart';

class TitleContentWidget extends StatelessWidget {
  final String title;
  final String label;
  const TitleContentWidget({super.key,required this.label,required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: title, style: AppTextstyles.subtitle),
          TextSpan(
            text: label,
            style: AppTextstyles.semiBold,
          ),
        ],
      ),
    );
  }
}
