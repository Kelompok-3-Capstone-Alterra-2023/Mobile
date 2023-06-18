import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/article/detail_article_screen.dart';
import 'package:prevent/view/screens/article/search_article_screen.dart';
import 'package:prevent/view_models/articles_view_model.dart';
import 'package:provider/provider.dart';

import '../../../util/common.dart';

class ViewAllArticleScreen extends StatefulWidget {
  const ViewAllArticleScreen({super.key});

  @override
  State<ViewAllArticleScreen> createState() => _ViewAllArticleScreenState();
}

class _ViewAllArticleScreenState extends State<ViewAllArticleScreen> {
  List<String> category = [
    'Semua',
    'Kesehatan Mental',
    'Stress',
    'Depresi',
    'Gangguan Kepribadian',
    'Mental Ill',
    'Miskin',
    'Kaya',
  ];
  final ValueNotifier<int?> selectedCategory = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.viewAllArticleFirst,
          // 'Artikel',
          style: TextStyle(color: blackColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchArticleScreen(),
                ),
              );
            },
            icon: Iconify(
              Eva.search_outline,
              color: blackColor,
              size: 45,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.01),
          child: Container(
            color: blackColor.withOpacity(0.3),
            height: 1,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // TODO: Fitur Sorting
                child: Wrap(spacing: 8, direction: Axis.horizontal, children: [
                  const SizedBox(width: 2),
                  ...List<Widget>.generate(
                    category.length,
                    (int index) {
                      return ListenableBuilder(
                        listenable: selectedCategory,
                        builder: (context, child) {
                          return ChoiceChip(
                            side:
                                BorderSide(color: colorStyleFifth, width: 1.2),
                            selectedColor: colorStyleFifth,
                            backgroundColor: Colors.transparent,
                            labelStyle: GoogleFonts.poppins(
                              fontWeight: medium,
                              fontSize: 10,
                              color: selectedCategory.value == index
                                  ? whiteColor
                                  : colorStyleFifth,
                            ),
                            label: Text(category[index]),
                            selected: selectedCategory.value == index,
                            onSelected: (bool selected) {
                              if (selectedCategory.value != index) {
                                selectedCategory.value =
                                    selected ? index : null;
                              }
                            },
                          );
                        },
                      );
                    },
                  ).toList(),
                ]),
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const DetailArticleScreen(id: ,)));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                  child: Consumer<ArticlesViewModel>(
                      builder: (context, provider, child) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.articles.length,
                      itemBuilder: (context, index) {
                        final data = provider.articles[index];
                        return Card(
                          elevation: 3,
                          child: Container(
                            height: 100,
                            width: 412,
                            color: whiteColor,
                            child: Row(
                              children: [
                                Image.asset('assets/images/stress.png'),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 14),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: colorStyleThird,
                                          border: Border.all(
                                              color: colorStyleFifth),
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            // AppLocalizations.of(context)!
                                            //     .viewAllArticleFourth,
                                            data.category,
                                            // 'Stress',
                                            style: TextStyle(fontSize: 8),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 14),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 32),
                                          child: Text(
                                            // AppLocalizations.of(context)!
                                            //     .detailArticleFirst,
                                            data.title,
                                            // 'Ini 9 Tanda Holiday Blues Setelah Libur Lebaran Selesai',
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 3);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
