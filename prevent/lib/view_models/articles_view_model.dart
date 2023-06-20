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
  List<Data> _filteredData = [];
  bool _isSearching = false;

  List<Data> get filteredData => _filteredData;
  bool get isSearching => _isSearching;

  Future<void> getArticles() async {
    final response = await service.getArticles();
    articles = response.data;

    notifyListeners();
  }

  Future<void> getArticlesByCategory(String category) async {
    final response = await service.getArticlesByCategory(category);
    articles = response.data;
    notifyListeners();
  }

  Future<Datas> getDetailArticle(int id) async {
    final response = await service.getDetailArticle(id);
    return response.data;
  }

  Future<void> searchArticles(String keyword) async {
    final response = await service.getSearchArticle(keyword.toLowerCase());
    articles = response.data;

    notifyListeners();
  }

  void filterData(String keyword) {
    _filteredData = articles
        .where(
            (data) => data.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void setIsSearching(bool value) {
    _isSearching = value;
    notifyListeners();
  }
}
