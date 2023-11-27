// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      gender: json['gender'] as String?,
      id: json['id'] as int?,
      image: json['image'] as String?,
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'image': instance.image,
      'gender': instance.gender,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
      'token': instance.token,
      'id': instance.id,
    };
