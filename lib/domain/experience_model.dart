class ExperienceModel {
  final String? employer;
  final String? jobTitle;
  final String? location;
  final String? startDate;
  final String? endDate;
  final String? description;

  ExperienceModel({
    this.employer,
    this.jobTitle,
    this.location,
    this.startDate,
    this.endDate,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'employer': employer,
      'jobTitle': jobTitle,
      'location': location,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
    };
  }

  factory ExperienceModel.fromMap(Map<String, dynamic> map) {
    return ExperienceModel(
      employer: map['employer'],
      jobTitle: map['jobTitle'],
      location: map['location'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      description: map['description'],
    );
  }

  @override
  String toString() {
    return 'ExperienceModel(employer: $employer, jobTitle: $jobTitle, location: $location, startDate: $startDate, endDate: $endDate, description: $description)';
  }
}