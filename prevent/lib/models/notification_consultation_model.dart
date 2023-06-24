class NotificationConsultation {
  final String title;
  final String message;
  final String dateTime;
  final String image;

  NotificationConsultation({
    required this.title,
    required this.message,
    required this.dateTime,
    required this.image,
  });

  factory NotificationConsultation.fromJson(Map<String, dynamic> json) {
    return NotificationConsultation(
      title: json['title'],
      message: json['message'],
      dateTime: json['dateTime'],
      image: json['image'],
    );
  }
}
