class ConsultationHistory {
  final String doctorName;
  final String method;
  final String dateTime;
  final String specialist;
  final String duration;
  final int consultationFee;
  final int drugCost;
  final String image;

  ConsultationHistory({
    required this.doctorName,
    required this.method,
    required this.dateTime,
    required this.specialist,
    required this.duration,
    required this.consultationFee,
    required this.drugCost,
    required this.image,
  });

  factory ConsultationHistory.fromJson(Map<String, dynamic> json) {
    return ConsultationHistory(
        doctorName: json['doctor_name'],
        method: json['method'],
        dateTime: json['dateTime'],
        specialist: json['specialist'],
        duration: json['duration'],
        consultationFee: json['consultation_fee'],
        drugCost: json['drug_cost'],
        image: json['image']);
  }
}

class ConsultationRunning {
  final String doctorName;
  final String method;
  final String dateTime;
  final String specialist;
  final String duration;
  final int consultationFee;
  final int drugCost;
  final String image;

  ConsultationRunning({
    required this.doctorName,
    required this.method,
    required this.dateTime,
    required this.specialist,
    required this.duration,
    required this.consultationFee,
    required this.drugCost,
    required this.image,
  });

  factory ConsultationRunning.fromJson(Map<String, dynamic> json) {
    return ConsultationRunning(
        doctorName: json['doctor_name'],
        method: json['method'],
        dateTime: json['dateTime'],
        specialist: json['specialist'],
        duration: json['duration'],
        consultationFee: json['consultation_fee'],
        drugCost: json['drug_cost'],
        image: json['image']);
  }
}
