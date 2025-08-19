import 'package:flutter/material.dart';

import '../models/books_model.dart';
import '../themes/app_colors.dart';
import '../themes/app_textstyles.dart';

class BookCard extends StatelessWidget {
  final Work work;
  final VoidCallback? onFavouriteToggle;

  const BookCard({super.key, required this.work, this.onFavouriteToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: greyColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.menu_book_sharp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.61,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(work.title ?? '', style: AppTextstyles.title),
                          Text(
                            'Author: ${work.authors?.map((a) => a.name).join(', ') ?? ''}',
                            style: AppTextstyles.subtitle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (work.isFavourite != null && work.isFavourite!)
                  IconButton(
                    onPressed: onFavouriteToggle,
                    icon: Icon(Icons.favorite, color: Colors.red, size: 25),
                  )
                else
                  IconButton(
                    onPressed: onFavouriteToggle,
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
