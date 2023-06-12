import 'package:flutter/material.dart';
import 'package:prevent/util/theme.dart';

import '../../../util/common.dart';

class DetailArticleScreen extends StatelessWidget {
  const DetailArticleScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.detailArticleFirst,
              // 'Ini 9 Tanda Holiday Blues Setelah Libur Lebaran Selesai',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: labelColor,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      AppLocalizations.of(context)!.subTitleArticle,
                      // 'Kesehatan Mental',
                      style: TextStyle(fontSize: 8, color: colorNavBar),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  AppLocalizations.of(context)!.detailArticleSecond,
                  // '30 menit',
                  style: const TextStyle(fontSize: 8),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.detailArticleThird,
              // 'Ditinjau oleh Dr. Fauzan Hakim M.Psi.Psi 25 April 2023',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 26),
            Container(
              height: 180,
              width: double.infinity,
              color: blackColor,
              child: Image.asset(
                'assets/images/image_article.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 26),
            Paragraph(
              text: AppLocalizations.of(context)!.detailArticleFourth,
              // text:'Prevent! Jakarta - Libur Lebaran yang cukup panjang menjadi waktu yang tepat bagi banyak orang untuk kembali ke kampung halaman dan berkumpul bersama keluarga. Bukan itu saja, ini menjadi momen kamu bisa beristirahat tanpa melakukan pekerjaan sehari-hari. Dengan begitu, energi akan kembali terkumpul saat libur Lebaran usai.'
            ),
            Paragraph(
              text: AppLocalizations.of(context)!.detailArticleFifth,
              // text:
              //     'Namun, ada sebagian orang yang malah merasakan cemas, khawatir, dan tidak bersemangat untuk kembali melakukan rutinitas sehari-hari. Bahkan, kamu merasa sedih saat tiba di rumah ketika akan memulai pekerjaan dan kegiatan sehari-hari setelah libur Lebaran. Hati-hati, bisa jadi kamu ternyata mengalami holiday blues, lho!',
            ),
            Paragraph(
              text: AppLocalizations.of(context)!.detailArticleSixth,
              // text:
              //     'Inilah Tanda Holiday Blues yang Perlu Kamu Waspadai\nBerlibur adalah salah satu cara yang baik untuk menjaga kesehatan mental. Kegiatan ini membantu kamu menurunkan tingkat stres, gangguan cemas, hingga depresi. Namun, waspada terhadap holiday blues atau post holiday syndrome yang bisa dialami oleh siapa saja setelah liburan panjang.',
            ),
            Paragraph(
              text: AppLocalizations.of(context)!.detailArticleSeventh,
              // text:
              //     'Umumnya, kebahagiaan pengidap post holiday syndrome tidak akan bertahan lama. Setelah menjalani liburan, banyak orang yang kembali merasakan sedih atau perasaan tidak senang. Penyebab post holiday blues bisa terjadi akibat kelelahan baik secara fisik maupun psikis setelah melalui liburan yang panjang.',
            ),
          ],
        ),
      ),
    );
  }
}

class Paragraph extends StatelessWidget {
  final String text;
  final TextStyle style;

  const Paragraph(
      {super.key, required this.text, this.style = const TextStyle()});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
