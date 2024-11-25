class MyExperienceModel {
  final String title;
  final String description;

  MyExperienceModel({
    required this.title,
    required this.description,
  });

  factory MyExperienceModel.fromJson(Map<String, dynamic> json) {
    return MyExperienceModel(
      title: json['title'],
      description: json['description'],
    );
  }
}
