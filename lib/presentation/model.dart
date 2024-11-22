
class ModelData {
  final String imageData;
  final String title;
  final String route;

  ModelData( {required this.imageData, required this.title,required this.route,});
}


  List<ModelData> modelList = [
    ModelData(imageData: 'images/achievement.png', title: 'Contact Info',route: 'contact'),
    ModelData(imageData: 'images/briefcase.png', title: 'Carrier Objective', route: 'carrier'),
    ModelData(imageData: 'images/user.png', title: 'Personal Detalis', route: 'personal'),
    ModelData(imageData: 'images/achievement.png', title: 'Education',route: 'education'),
    ModelData(imageData: 'images/thinking.png', title: 'Experiences',route: 'experiences'),
    ModelData(imageData: 'images/achievement.png', title: 'Technical Skills',route:'techskills'),
    //ModelData(imageData: 'images/achievement.png', title: 'Interest/Hobbies',route:'hobbies'),
    ModelData(imageData: 'images/project.png', title: 'Project',route: 'project'),
    ModelData(imageData: 'images/achievement.png', title: 'Achievements',route:'achievements'),
    ModelData(imageData: 'images/handshake.png', title: 'References',route:'reference'),
    ModelData(imageData: 'images/declaration.png', title: 'Declaration',route: 'declaration'),
  ];
