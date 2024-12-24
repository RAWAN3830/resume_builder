
class PersonalInfoModel {
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String jobTitle;
  final String address;
  final List<Links> links;

  PersonalInfoModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.jobTitle,
    required this.address,
    required this.links,
  });

  factory PersonalInfoModel.fromMap(Map<String, dynamic> map) {
    return PersonalInfoModel(
      firstname: map['firstname'],
      lastname: map['lastname'],
      email: map['email'],
      phone: map['phone'],
      jobTitle: map['jobTitle'],
      address: map['address'],
      links: (map['links'] as List<dynamic>)
          .map((link) => Links.fromMap(link as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'jobTitle': jobTitle,
      'address': address,
      'links': links.map((links) => links.toMap()).toList(),
    };
  }
}

class Links {
  final String name;
  final String link;

  Links({required this.name, required this.link});

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      name: map['name'],
      link: map['link'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'link': link,
    };
  }
}
