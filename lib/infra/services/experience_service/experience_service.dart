import '../../../domain/experience_model.dart';
class ExperienceService{
  // static Future<ExperienceModel> addExperienceDetails(){
  //
  // }

  final List<ExperienceModel> experienceList = [];


  void addExperience(ExperienceModel experienceModel) {
  experienceList.add(experienceModel);
  }

  void updateExperience(int index, ExperienceModel updatedEducation) {
  if (index >= 0 && index < experienceList.length) {
  experienceList[index] = updatedEducation;
  }
  }

  void deleteExperience(int index) {
  if (index >= 0 && index < experienceList.length) {
  experienceList.removeAt(index);
  }
  }

  void resetExperience() {
  experienceList.clear();
  }
  

}