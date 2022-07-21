class UserModel {
  late String userId, name, email, phone;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
  });

  UserModel.formJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }


  Map<String, dynamic> toMap() => {'userId': userId,'name':name,'email':email,'phone':phone};
}
