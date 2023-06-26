class ArticlesModel {
  ArticlesModel({
    required this.data,
    required this.message,
  });
  late final List<Data> data;
  late final String message;

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final datas = <String, dynamic>{};
    datas['data'] = data.map((e) => e.toJson()).toList();
    datas['message'] = message;
    return datas;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.category,
  });
  late final int id;
  late final String title;
  late final String thumbnail;
  late final String category;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final datas = <String, dynamic>{};
    datas['id'] = id;
    datas['title'] = title;
    datas['thumbnail'] = thumbnail;
    datas['category'] = category;
    return datas;
  }
}
