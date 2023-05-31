import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view_models/search_article_view_model.dart';
import 'package:provider/provider.dart';

class SearchArticleScreen extends StatefulWidget {
  const SearchArticleScreen({Key? key}) : super(key: key);

  @override
  State<SearchArticleScreen> createState() => _SearchArticleScreenState();
}

class _SearchArticleScreenState extends State<SearchArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(74),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: TextField(
              onChanged: (value) {
                context.read<SearchArticleViewModel>().filterData(value);
              },
              autofocus: true,
              cursorColor: blackColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFEEEEEE),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                ),
                focusColor: const Color(0xFFEEEEEE),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Iconify(
                    Eva.search_outline,
                    color: blackColor,
                    size: 45,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body:
          Consumer<SearchArticleViewModel>(builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.filteredData.isEmpty
              ? provider.allData.length
              : provider.filteredData.length,
          itemBuilder: (context, index) {
            final item = provider.filteredData.isEmpty
                ? provider.allData[index]
                : provider.filteredData[index];
            return ListTile(
              title: Text(item),
            );
          },
        );
      }),
    );
  }
}
