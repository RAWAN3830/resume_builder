class EducationModel {
  final String? institution;
  final String? location;
  final String? degreeType;
  final String? fieldOfStudy;
  final String? startDate;
  final String? endDate;

  EducationModel({
    this.institution,
    this.location,
    this.degreeType,
    this.fieldOfStudy,
    this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'institution': institution,
      'location': location,
      'degreeType': degreeType,
      'fieldOfStudy': fieldOfStudy,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
