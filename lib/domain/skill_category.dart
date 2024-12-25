class SkillCategory {
  final String name;
  final List<String> skills;

  const SkillCategory({
    required this.name,
    List<String>? skills,
  }) : skills = skills ?? const [];

  SkillCategory copyWith({
    String? name,
    List<String>? skills,
  }) {
    return SkillCategory(
      name: name ?? this.name,
      skills: skills ?? this.skills,
    );
  }
}
