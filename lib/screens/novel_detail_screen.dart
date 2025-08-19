import 'package:flutter/material.dart';
import 'package:my_books/models/books_model.dart';
import 'package:my_books/themes/strings.dart';
import 'package:my_books/utils/margin_extensions.dart';
import 'package:my_books/widgets/common_app_bar.dart';
import 'package:my_books/widgets/title_content_widget.dart';

import '../themes/app_colors.dart';
import '../themes/app_textstyles.dart';

class NovelDetailScreen extends StatelessWidget {
  final Work work;
  const NovelDetailScreen({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: work.title ?? ''),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              spacing: 15.0,
              children: [
                15.hBox,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: greyColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.menu_book_sharp,
                      color: Colors.black,
                      size: 75,
                    ),
                  ),
                ),
                Text(work.title ?? '', style: AppTextstyles.title),
                Text(
                  '${AppStrings.by} ${work.authors?.map((a) => a.name).join(', ') ?? ''}',
                  style: AppTextstyles.subtitle,
                ),
                Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (work.firstPublishYear != null)
                      TitleContentWidget(
                        title: AppStrings.firstPublished,
                        label: work.firstPublishYear.toString(),
                      ),
        
                    if (work.editionCount != null)
                      TitleContentWidget(
                        title: AppStrings.editions,
                        label: work.editionCount.toString(),
                      ),
                  ],
                ),
                if (work.subject?.isNotEmpty ?? false) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.subjects,
                      style: AppTextstyles.semiTitle,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
        
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 3,
                      children: work.subject!
                          .take(6)
                          .map(
                            (s) => Chip(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.white,
                              label: Text(s, style: AppTextstyles.semiBold),
                              side: BorderSide(
                                color: Colors.lightGreen,
                                width: 1,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
                if (work.availability != null)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        spacing: 15,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppStrings.availability,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (work.availability?.status != null)
                            TitleContentWidget(
                              title: AppStrings.status,
                              label: work.availability?.status == AppStrings.error
                                  ? AppStrings.notFound
                                  : work.availability!.status ?? '',
                            ),
                          if (work.availability!.isReadable != null)
                            TitleContentWidget(
                              title: AppStrings.readable,
                              label: work.availability!.isReadable == true
                                  ? AppStrings.yes
                                  : AppStrings.no,
                            ),
                          if (work.availability!.isPreviewable != null)
                            TitleContentWidget(
                              title: AppStrings.previewable,
                              label: work.availability!.isPreviewable == true
                                  ? AppStrings.yes
                                  : AppStrings.no,
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
