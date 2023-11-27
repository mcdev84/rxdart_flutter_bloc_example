import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class User {
  final String? image,
      gender,
      firstName,
      lastName,
      dob,
      email,
      password,
      username,
      token;
  final int? id;

  User(
      {this.gender,
      this.id,
      this.image,
      this.username,
      this.firstName,
      this.lastName,
      this.dob,
      this.email,
      this.password,
      this.token});

  static   User empty = User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
