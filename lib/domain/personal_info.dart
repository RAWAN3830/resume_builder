class Personal_info {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? jobTitle;
  final String? address;
  final List<Links> links;
  Personal_info(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.jobTitle,
      required this.links,
      required this.address});
}

class Links {
  final String name;
  final String link;
  Links({required this.name, required this.link});
}
