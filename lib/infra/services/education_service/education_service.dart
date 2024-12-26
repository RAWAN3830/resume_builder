import '../../../domain/education_model.dart';


class EducationService {

  final List<EducationModel> educationList = [];


  void addEducation(EducationModel education) {
    educationList.add(education);
  }

  void updateEducation(int index, EducationModel updatedEducation) {
    if (index >= 0 && index < educationList.length) {
      educationList[index] = updatedEducation;
    }
  }

  void deleteEducation(int index) {
    if (index >= 0 && index < educationList.length) {
      educationList.removeAt(index);
    }
  }

  void resetEducation() {
    educationList.clear();
  }
}
