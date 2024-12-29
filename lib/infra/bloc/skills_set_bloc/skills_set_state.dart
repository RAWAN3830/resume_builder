// class SkillsSetState {
//   final Map<String, List<String>> categories;
//   final String selectedCategory;
//   final String? error;
//
//   const SkillsSetState({
//     required this.categories,
//     required this.selectedCategory,
//     this.error,
//   });
//
//   factory SkillsSetState.initial() {
//     return const SkillsSetState(
//       categories: {
//         'Languages': [],
//         'Libraries/Frameworks': [],
//         'Tools/Platforms': [],
//         'Databases': [],
//       },
//       selectedCategory: 'Languages',
//     );
//   }
//
//   SkillsSetState copyWith({
//     Map<String, List<String>>? categories,
//     String? selectedCategory,
//     String? error,
//   }) {
//     return SkillsSetState(
//       categories: categories ?? this.categories,
//       selectedCategory: selectedCategory ?? this.selectedCategory,
//       error: error,
//     );
//   }
// }

class SkillsSetState {
  final Map<String, List<String>> categories;
  final String selectedCategory;
  final bool isLoading;
  final String? error;

  SkillsSetState({
    Map<String, List<String>>? categories,
    String? selectedCategory,
    this.isLoading = false,
    this.error,
  }) : categories = categories ?? defaultCategories,
        selectedCategory = selectedCategory ?? (categories?.keys.first ?? defaultCategories.keys.first);

  static final Map<String, List<String>> defaultCategories = {
    'Programming Languages': [],
    'Frameworks': [],
    'Databases': [],
    'Cloud Services': [],
    'Development Tools': [],
    'Soft Skills': [],
    'Languages': [],
    'Project Management': [],
  };

  SkillsSetState copyWith({
    Map<String, List<String>>? categories,
    String? selectedCategory,
    bool? isLoading,
    String? error,
  }) {
    return SkillsSetState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}