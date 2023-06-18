import 'package:flutter/material.dart';
import 'package:prevent/models/articles_model.dart';
import 'package:prevent/models/detail_article_model.dart';
import 'package:prevent/services/articles_api.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesViewModel() {
    getArticles();
  }
  final service = ArticlesApiService();
  List<Data> articles = [];

  Future<void> getArticles() async {
    final response = await service.getArticles();
    articles = response.data;

    notifyListeners();
  }

  Future<Datas> getDetailArticle(int id) async {
    final response = await service.getDetailArticle(id);
    return response.data;
  }
}
