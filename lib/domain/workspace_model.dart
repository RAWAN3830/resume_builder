import 'package:flutter_svg/flutter_svg.dart';
import 'package:resume/core/constant/strings.dart';
import '../core/constant/assets_svg_image.dart';

class WorkSpaceModel{
  final SvgPicture icon;
  final String title;

  WorkSpaceModel({required this.icon, required this.title});
}

List<WorkSpaceModel> workSpaceModelList = [
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.contactInfo) , title:Strings.personalInfo),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.education) , title: Strings.education),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.experience) , title: Strings.experience),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.skillset) , title:  Strings.skillsets),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.projects) , title:  Strings.projects),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.achievement) , title:  Strings.achievement),
  WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.declaration) , title: Strings.declaration),

  // WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.carrierObjective) , title: Strings.carrierObjective,),
  // WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.personalDetails) , title: Strings.personalDetails),
  // WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.hobbies) , title:  Strings.hobbies),
  // WorkSpaceModel(icon: SvgPicture.asset(AssetsSvgImage.references) , title:  Strings.references),


];