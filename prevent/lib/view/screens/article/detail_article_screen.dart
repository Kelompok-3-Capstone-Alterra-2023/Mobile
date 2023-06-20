import 'package:flutter/material.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view_models/articles_view_model.dart';
import 'package:provider/provider.dart';
import '../../../util/common.dart';

class DetailArticleScreen extends StatelessWidget {
  const DetailArticleScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    final datas = context.read<ArticlesViewModel>().getDetailArticle(id);
    return Consumer<ArticlesViewModel>(builder: (context, provider, child) {
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
            AppLocalizations.of(context)!.subTitleArticle,

            // 'Kesehatan Mental',
            style: TextStyle(color: blackColor),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: blackColor,
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
        body: FutureBuilder(
            future: datas,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        // AppLocalizations.of(context)!.detailArticleFirst,
                        snapshot.data!.title,
                        // 'Ini 9 Tanda Holiday Blues Setelah Libur Lebaran Selesai',
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: labelColor,
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                // AppLocalizations.of(context)!.subTitleArticle,
                                snapshot.data!.category,
                                // 'Kesehatan Mental',
                                style:
                                    TextStyle(fontSize: 8, color: colorNavBar),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalizations.of(context)!.detailArticleSecond,
                            // snapshot.data!.
                            // '30 menit',
                            style: const TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        // AppLocalizations.of(context)!.detailArticleThird,
                        '${snapshot.data!.doctorName} ${snapshot.data!.date}',
                        // 'Ditinjau oleh Dr. Fauzan Hakim M.Psi.Psi 25 April 2023',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 26),
                      snapshot.data!.thumbnail.isNotEmpty
                          ? Container(
                              height: 180,
                              width: double.infinity,
                              color: shadowText,
                              child: Image.network(
                                // 'assets/images/image_article.png',
                                snapshot.data!.thumbnail,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
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
                            )
                          : Container(
                              height: 180,
                              width: double.infinity,
                              color: blackColor,
                              child: Image.asset(
                                'assets/images/image_article.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                      const SizedBox(height: 26),
                      // Text(snapshot.data!.content),
                      // LayoutBuilder(
                      //   builder:
                      //       (BuildContext context, BoxConstraints constraints) {
                      //     return WebView(
                      //       initialUrl: 'about:blank',
                      //       onWebViewCreated:
                      //           (WebViewController webViewController) {
                      //         // Load HTML content when WebView is created
                      //         webViewController.loadUrl(Uri.dataFromString(
                      //           snapshot.data!.content,
                      //           mimeType: 'text/html',
                      //           encoding: Encoding.getByName('utf-8'),
                      //         ).toString());
                      //       },
                      //     );
                      //   },
                      // )
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
      );
    });
  }
}
