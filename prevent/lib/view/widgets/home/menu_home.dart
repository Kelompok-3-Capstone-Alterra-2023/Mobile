import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:prevent/view/screens/article/detail_article_screen.dart';
import 'package:prevent/view/screens/article/search_article_screen.dart';
import 'package:prevent/view/screens/article/view_all_article_screen.dart';
import 'package:prevent/view/screens/consultation/consultation_screen.dart';
import 'package:prevent/view/screens/view_all_doctor/custom_search.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';
import 'package:prevent/view_models/articles_view_model.dart';
import 'package:provider/provider.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';

class MenuHome extends StatelessWidget {
  const MenuHome({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: const EdgeInsets.only(left: 10),
              icon: Iconify(
                Ph.list,
                size: 36,
                color: whiteColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        elevation: 0,
        title: Image.asset('assets/images/logo_app.png'),
        centerTitle: true,
        backgroundColor: colorStyleFifth,
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
              Ri.search_line,
              size: 24,
              color: whiteColor,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/homepage_one.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.titleHome,
                        // 'Kesehatan Mental Prioritas Global',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: bold,
                            fontSize: 12.5,
                            color: successThird),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        AppLocalizations.of(context)!.subTitleHome,
                        // 'Prevent! merupakan salah satu platform konsultasi psikolog terbaik yang bisa bantu hadapi permsalahanmu!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: reguler,
                            fontSize: 10,
                            color: blackColor),
                      ),
                      const SizedBox(height: 18),
                      TextButton(
                        style: TextButton.styleFrom(
                            minimumSize: const Size(170, 40),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            backgroundColor: colorStyleFifth),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ConsultationScreen(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.consultation,
                          // 'Konsultasi',
                          style: GoogleFonts.poppins(
                              fontWeight: bold,
                              fontSize: 15,
                              color: whiteColor),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.latestArticles,
                  // 'Artikel Terbaru',
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ViewAllArticleScreen()));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.viewAll,
                    // 'Lihat Semua',
                    style: GoogleFonts.poppins(
                        fontSize: 10, fontWeight: bold, color: blackColor),
                  ),
                ),
                // ),
              ],
            ),
          ),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                                selectedCategory.value = selected ? index : 0;
                                if (selectedCategory.value != 0) {
                                  context
                                      .read<ArticlesViewModel>()
                                      .getArticlesByCategory(category[index]);
                                } else {
                                  context
                                      .read<ArticlesViewModel>()
                                      .getArticles();
                                }
                              }
                            },
                          );
                        },
                      );
                    },
                  ).toList(),
                ]),
              ),
              Consumer<ArticlesViewModel>(builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.articles.length,
                    itemBuilder: (context, index) {
                      final data = provider.articles[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailArticleScreen(
                                          id: data.id,
                                        )));
                          },
                          child: Card(
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 157,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: Image.network(
                                      data.thumbnail,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10, fontWeight: medium),
                                      ),
                                      const SizedBox(
                                        height: 11,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: colorStyleThird
                                                .withOpacity(0.40),
                                            border: Border.all(
                                                color: colorStyleThird),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3))),
                                        child: Text(
                                          // AppLocalizations.of(context)!
                                          //     .subTitleArticle,
                                          data.category,
                                          // 'Kesehatan Mental',
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: medium,
                                              color: colorStyleFifth),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
