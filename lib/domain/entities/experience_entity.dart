class ExperienceEntity {
  final String role;
  final String company;
  final String duration;
  final String location;
  final String description;
  final List<String> responsibilities;
  final List<String> technologies;

  const ExperienceEntity({
    required this.role,
    required this.company,
    required this.duration,
    required this.location,
    required this.description,
    required this.responsibilities,
    required this.technologies,
  });
}
