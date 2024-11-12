class UserModel {
  final String name;
  final String email;
  final String bio;
  final String avatarPath;
  final String likediUrl;
  final String githubUrl;

  UserModel({
    required this.name,
    required this.email,
    required this.bio,
    required this.avatarPath,
    required this.likediUrl,
    required this.githubUrl,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      bio: json['bio'],
      avatarPath: json['avatar_path'],
      likediUrl: json['linkedin_url'],
      githubUrl: json['github_url'],
    );
  }
}
