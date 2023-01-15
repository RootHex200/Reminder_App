

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

class AuthModel {
  final ObjectId id;
  final String email;
  final String password;
  AuthModel({
    required this.id,
    required this.email,
    required this.password,
  });



  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'_id': id});
    result.addAll({'email': email.trim()});
    result.addAll({'password': password.trim()});
  
    return result;
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: map['_id'],
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source));

  @override
  String toString() => 'AuthModel(_id: $id, email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthModel &&
      other.id == id &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ password.hashCode;
}
