class SkillsSetState {
  final Map<String, List<String>> categories;
  final String selectedCategory;
  final String? error;

  const SkillsSetState({
    required this.categories,
    required this.selectedCategory,
    this.error,
  });

  factory SkillsSetState.initial() {
    return const SkillsSetState(
      categories: {
        'Languages': [],
        'Libraries/Frameworks': [],
        'Tools/Platforms': [],
        'Databases': [],
      },
      selectedCategory: 'Languages',
    );
  }

  SkillsSetState copyWith({
    Map<String, List<String>>? categories,
    String? selectedCategory,
    String? error,
  }) {
    return SkillsSetState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      error: error,
    );
  }
}