import 'package:flutter/material.dart';
import 'package:my_books/screens/novel_detail_screen.dart';
import 'package:my_books/themes/app_textstyles.dart';
import 'package:my_books/utils/margin_extensions.dart';
import 'package:my_books/utils/screen_utils.dart';
import 'package:my_books/widgets/common_app_bar.dart';
import 'package:provider/provider.dart';

import '../providers/book_provider.dart';
import '../themes/strings.dart';
import '../widgets/book_card.dart';

class NovelListingScreen extends StatelessWidget {
  const NovelListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.loadWishlist();
      if (provider.booksList.isEmpty && !provider.isLoading) {
        provider.getNovelsList();
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: AppStrings.books, isBackArrowNeeded: false),
      body: Builder(
        builder: (context) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(15),
                  separatorBuilder: (context, index) =>
                    10.hBox,
                  itemCount: provider.currentBooksList.length,
                  itemBuilder: (context, index) {
                    var item = provider.currentBooksList[index];
                    return GestureDetector(
                      onTap: () {
                        Screen.open(NovelDetailScreen(work: item));
                      },
                      child: BookCard(
                        work: item,

                        onFavouriteToggle: () {
                          provider.toggleFavourite(item);
                        },
                      ),
                    );
                  },
                ),
              ),
             15.hBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: provider.currentPage > 1
                        ? () {
                            provider.goToPage(provider.currentPage - 1);
                          }
                        : null,
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  ...List.generate(provider.totalPages, (index) {
                    final pageNo = index + 1;
                    final isSelected = pageNo == provider.currentPage;
                    return GestureDetector(
                      onTap: () {
                        provider.goToPage(pageNo);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? Colors.lightGreen
                              : Colors.grey[100],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            pageNo.toString(),
                            style: AppTextstyles.bodyText.copyWith(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  IconButton(
                    onPressed: provider.currentPage < provider.totalPages
                        ? () {
                            provider.goToPage(provider.currentPage + 1);
                          }
                        : null,
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
             20.hBox,
            ],
          );
        },
      ),
    );
  }
}
