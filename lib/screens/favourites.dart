import 'package:flutter/material.dart';
import 'package:my_books/providers/book_provider.dart';
import 'package:my_books/themes/strings.dart';
import 'package:my_books/utils/margin_extensions.dart';
import 'package:my_books/widgets/book_card.dart';
import 'package:my_books/widgets/common_app_bar.dart';
import 'package:provider/provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.loadWishlist();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: AppStrings.favourites),
      body: Builder(
        builder: (context) {
          if (provider.wishlist.isEmpty) {
            return Center(child: Text(AppStrings.noBooksAdded));
          }
          return ListView.separated(
            padding: EdgeInsets.all(15),
            separatorBuilder: (context, index) => 15.hBox,
            itemCount: provider.wishlist.length,
            itemBuilder: (context, index) {
              return BookCard(
                work: provider.wishlist[index],
                onFavouriteToggle: () {
                  provider.toggleFavourite(provider.wishlist[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
