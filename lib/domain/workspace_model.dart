import 'package:flutter_svg/flutter_svg.dart';

import '../core/constant/assets_svg_image.dart';

class WorkSpaceModel{
  final SvgPicture icon;
  final String title;

  WorkSpaceModel({required this.icon, required this.title});
}

List<WorkSpaceModel> workSpaceModelList = [
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.contactInfo) , title: 'Contact_info'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.carrierObjective) , title: 'Carrier_objective'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.personalDetails) , title: 'Personal_details'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.education) , title: 'Education'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.experience) , title: 'Experience'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.technicalSkill) , title: 'Technical_skill'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.hobbies) , title: 'Hobbies'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.projects) , title: 'Projects'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.achievement) , title: 'Achievements'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.references) , title: 'References'),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.declaration) , title: 'Declaration'),

];