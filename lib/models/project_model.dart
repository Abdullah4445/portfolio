class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String projectUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.projectUrl, required List<String> techStack,
  });
}