class UserModel {
  final String name;
  final String email;
  final String id;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  toJson(){
    return {
      'id' : id ,
      'name' : name ,
      'email' : email,
    };
  }
}
