import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(name: '_id')
  final String id;
  final String username;
  final String email;
  final String phoneNumber;
  final String alternateEmail;
  @JsonKey(defaultValue: [])
  late List<String> outletsOwned;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.alternateEmail,
    required this.outletsOwned,
  });
  factory UserModel.fromJson(Map<String, dynamic> map) =>
      _$UserModelFromJson(map);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
