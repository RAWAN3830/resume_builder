import 'package:flutter_svg/flutter_svg.dart';

class WorkSpaceModel{
  final SvgPicture icon;
  final String title;

  WorkSpaceModel({required this.icon, required this.title});
}

List<WorkSpaceModel> workSpaceModelList = <WorkSpaceModel>[
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/contact_info.svg') , title: 'Contact_info'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/carrier_objective.svg') , title: 'Carrier_objective'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/personal_details.svg') , title: 'Personal_details'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/education.svg') , title: 'Education'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/experience.svg') , title: 'Experience'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/technical_skill.svg') , title: 'Technical_skill'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/hobbies.svg') , title: 'Hobbies'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/projects.svg') , title: 'Projects'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/achivements.svg') , title: 'Achivements'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/references.svg') , title: 'References'),
  WorkSpaceModel(icon: SvgPicture.asset('assets/icons/declaration.svg') , title: 'Declaration'),

];