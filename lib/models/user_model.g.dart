// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      alternateEmail: json['alternateEmail'] as String,
    )..outletsOwned = (json['outletsOwned'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [];

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'alternateEmail': instance.alternateEmail,
      'outletsOwned': instance.outletsOwned,
    };