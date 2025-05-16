class StudentsModel {
  final int id;
  final String name;
  final String birthdate;
  final String? email;
  final String phone;
  final String? profileImage;

  StudentsModel({
    required this.id,
    required this.name,
    required this.birthdate,
    this.email,
    required this.phone,
    this.profileImage,
  });

  factory StudentsModel.fromJson(Map<String, dynamic> json) {
    return StudentsModel(
      id: json['id'],
      name: json['name'],
      birthdate: json['birthdate'],
      email: json['email'],
      phone: json['phone'],
      profileImage: json['profile_image'],
    );
  }
}
