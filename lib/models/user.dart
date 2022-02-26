import 'dart:convert';

class User {
  String token;
  int idUser;
  String firstName;
  String lastName;
  String email;
  int typeUser;
  User({
    required this.token,
    required this.idUser,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.typeUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'idUser': idUser,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'typeUser': typeUser,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      token: map['token'] ?? '',
      idUser: map['id']?.toInt() ?? 0,
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      email: map['email'] ?? '',
      typeUser: map['user_type_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
