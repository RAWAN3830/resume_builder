// abstract class SkillsSetEvent {}
//
// class AddSkill extends SkillsSetEvent {
//   final String skill;
//   final String category;
//
//   AddSkill({required this.skill, required this.category});
// }
//
// class RemoveSkill extends SkillsSetEvent {
//   final String skill;
//   final String category;
//
//   RemoveSkill({required this.skill, required this.category});
// }
//
// class ChangeCategory extends SkillsSetEvent {
//   final String category;
//
//   ChangeCategory({required this.category});
// }

abstract class SkillsSetEvent {}

class LoadSkills extends SkillsSetEvent {}

class AddSkill extends SkillsSetEvent {
  final String skill;
  final String category;

  AddSkill({required this.skill, required this.category});
}

class RemoveSkill extends SkillsSetEvent {
  final String skill;
  final String category;

  RemoveSkill({required this.skill, required this.category});
}

class ChangeCategory extends SkillsSetEvent {
  final String category;

  ChangeCategory({required this.category});
}