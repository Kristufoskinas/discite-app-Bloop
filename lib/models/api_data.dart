class ApiData {
  late int id;
  late String userText;
  late String summarizedText;
  late String createdDate;
  late bool? saved;
  late double percentage;

  ApiData(
      {required this.id,
      required this.userText,
      required this.summarizedText,
      required this.createdDate,
      required this.saved,
      required this.percentage});

  ApiData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userText = json['user_text'];
    summarizedText = json['summarized_text'];
    createdDate = json['created_date'];
    saved = json['saved'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_text'] = this.userText;
    data['summarized_text'] = this.summarizedText;
    data['created_date'] = this.createdDate;
    data['saved'] = this.saved;
    data['percentage'] = this.percentage;
    return data;
  }
}
