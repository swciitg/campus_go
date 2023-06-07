import 'package:json_annotation/json_annotation.dart';
part 'admin_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AdminModel {
  @JsonKey(name: '_id')
  final String id;
  final String username;
  final String password;
  @JsonKey(defaultValue: [])
  late List<String> outletsOwned;

  AdminModel({
    required this.id,
    required this.username,
    required this.password,
  });
  factory AdminModel.fromJson(Map<String, dynamic> map) =>
      _$AdminModelFromJson(map);

  Map<String, dynamic> toJson() => _$AdminModelToJson(this);
}
