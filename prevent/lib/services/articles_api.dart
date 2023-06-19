import 'package:dio/dio.dart';
import 'package:prevent/models/articles_model.dart';
import 'package:prevent/models/detail_article_model.dart';

class ArticlesApiService {
  final url = 'https://capstone-project.duckdns.org:8080/articles';
  final dio = Dio();

  Future<ArticlesModel> getArticles() async {
    try {
      final response = await dio.get(url);
      ArticlesModel model = ArticlesModel.fromJson(response.data);
      return model;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<ArticlesModel> getArticlesByCategory(String category) async {
    try {
      final response = await dio.get('$url?category=$category');
      ArticlesModel model = ArticlesModel.fromJson(response.data);
      return model;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<ArticlesModel> getSearchArticle(String keyword) async {
    try {
      final response = await dio.get('$url/search?keyword=$keyword');
      ArticlesModel model = ArticlesModel.fromJson(response.data);
      return model;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<DetailArticle> getDetailArticle(int id) async {
    try {
      final response = await dio.get('$url/$id');
      DetailArticle model = DetailArticle.fromJson(response.data);
      return model;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
