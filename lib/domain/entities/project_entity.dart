class ProjectEntity {
  final String id;
  final String title;
  final String category;
  final String badge;
  final String description;
  final List<String> highlights;
  final List<String> technologies;
  final String? iconAsset;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? webUrl;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.badge,
    required this.description,
    required this.highlights,
    required this.technologies,
    this.iconAsset,
    this.playStoreUrl,
    this.appStoreUrl,
    this.webUrl,
  });
}
