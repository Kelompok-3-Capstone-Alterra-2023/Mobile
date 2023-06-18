import 'package:dio/dio.dart';
import 'package:prevent/models/articles_model.dart';
import 'package:prevent/models/detail_article_model.dart';

class ArticlesApiService {
  final url =
      'http://ec2-3-27-124-243.ap-southeast-2.compute.amazonaws.com:8080/articles';
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

  Future<ArticlesModel> getArticlesByCategory(String param) async {
    try {
      final response = await dio.get('$url?category=$param');
      ArticlesModel model = ArticlesModel.fromJson(response.data);
      return model;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<ArticlesModel> getSearchArticle() async {
    try {
      final response = await dio.get('$url/search?keyword=');
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
