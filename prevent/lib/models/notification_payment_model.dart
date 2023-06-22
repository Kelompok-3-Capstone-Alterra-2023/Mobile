class NotificationPayment {
  final String title;
  final String message;
  final String dateTime;
  final String image;

  NotificationPayment({
    required this.title,
    required this.message,
    required this.dateTime,
    required this.image,
  });

  factory NotificationPayment.fromJson(Map<String, dynamic> json) {
    return NotificationPayment(
      title: json['title'],
      message: json['message'],
      dateTime: json['dateTime'],
      image: json['image'],
    );
  }
}
