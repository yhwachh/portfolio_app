class ProjectsModel {
  final String title;
  final String description;
  final List<String> skills;
  final String? link;
  final String imagePath;

  ProjectsModel({
    required this.title,
    required this.description,
    required this.skills,
    required this.link,
    required this.imagePath,
  });

  factory ProjectsModel.fromJson(Map<String, dynamic> json) {
    return ProjectsModel(
      title: json['title'],
      description: json['description'],
      skills: List<String>.from(json['skills']),
      link: json['link'],
      imagePath: json['image_path'],
    );
  }
}
