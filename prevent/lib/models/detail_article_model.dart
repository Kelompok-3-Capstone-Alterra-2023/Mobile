class DetailArticle {
  DetailArticle({
    required this.data,
    required this.message,
  });
  late final Datas data;
  late final String message;

  DetailArticle.fromJson(Map<String, dynamic> json) {
    data = Datas.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final datas = <String, dynamic>{};
    datas['data'] = data.toJson();
    datas['message'] = message;
    return datas;
  }
}

class Datas {
  Datas({
    required this.id,
    required this.date,
    required this.doctorName,
    required this.title,
    required this.thumbnail,
    required this.content,
    required this.category,
    required this.estRead,
  });
  late final int id;
  late final String date;
  late final String doctorName;
  late final String title;
  late final String thumbnail;
  late final String content;
  late final String category;
  late final int estRead;

  Datas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    doctorName = json['doctor_name'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    content = json['content'];
    category = json['category'];
    estRead = json['est_read'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['doctor_name'] = doctorName;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['content'] = content;
    data['category'] = category;
    data['est_read'] = estRead;
    return data;
  }
}
