import 'package:portfolio_app/models/projects_model.dart';
import 'package:portfolio_app/models/user_model.dart';

class MyDataModel {
  final UserModel user;
  final List<String> skills;
  final List<ProjectsModel> projects;

  MyDataModel(
      {required this.user, required this.skills, required this.projects});

  factory MyDataModel.fromJson(Map<String, dynamic> json) {
    return MyDataModel(
      user: UserModel.fromJson(json['user']),
      skills: List<String>.from(json['skills']),
      projects: (json['projects'] as List).map((e) {
        return ProjectsModel.fromJson(e);
      }).toList(),
    );
  }
}