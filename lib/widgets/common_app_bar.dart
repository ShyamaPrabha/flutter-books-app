import 'package:flutter/material.dart';

import '../screens/favourites.dart';
import '../themes/app_textstyles.dart';
import '../utils/screen_utils.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackArrowNeeded;
  final String title;
  const CommonAppBar({
    super.key,
    this.isBackArrowNeeded = true,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
       actionsPadding: EdgeInsets.symmetric(horizontal: 25),
      actions: !isBackArrowNeeded
          ? [
              IconButton(
                onPressed: () {
                  Screen.open(Favourites());
                },
                icon: Icon(Icons.favorite_outlined, color: Colors.red),
              ),
            ]
          : null,
      leading: isBackArrowNeeded
          ? IconButton(
              onPressed: () => Screen.close(),
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            )
          : null,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: AppTextstyles.title.copyWith(color: Colors.white),
      ),
      backgroundColor: Colors.lightGreen,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
