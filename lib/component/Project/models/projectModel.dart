class ProjectModel {
  final String title;
  final String desc;
  final List<String> tags;
  final bool isSecret;
  final String? githubUrl;
  final String imageUrl;

  ProjectModel({
    required this.title,
    required this.desc,
    required this.tags,
    this.isSecret = false,
    this.githubUrl,
    required this.imageUrl,
  });

  // Cette méthode transforme le Map (JSON) en objet ProjectModel
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'] ?? '',
      desc: json['desc'] ?? '',
      // On convertit la liste dynamique du JSON en List<String>
      tags: List<String>.from(json['tags'] ?? []),
      isSecret: json['isSecret'] ?? false,
      githubUrl: json['githubUrl'],
      imageUrl: json['imageUrl'] ?? 'assets/projects/default.jpg',
    );
  }
}
