class ContactModel {
  int id;
  final String name;
  final String telephone;
  final String email;
  final String account;

  ContactModel({
    required this.id,
    required this.name,
    required this.telephone,
    required this.email,
    required this.account,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      telephone: json['telphone'] ?? '',
      email: json['email'] ?? '',
      account: json['akun'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': name,
      'telphone': telephone,
      'email': email,
      'akun': account,
    };
  }
}
