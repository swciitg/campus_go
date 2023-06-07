import 'package:json_annotation/json_annotation.dart';
part 'outlet_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OutletModel {
  @JsonKey(name: '_id')
  final String id;
  final String outletName;
  final String location;
  final String phoneNumber;
  final String category;
  final bool status;
  final String outletKey;
  @JsonKey(defaultValue: [])
  late List<String> service;

  OutletModel(
      {required this.outletName,
      required this.location,
      required this.phoneNumber,
      required this.category,
      required this.status,
      required this.outletKey,
      required this.id});
  factory OutletModel.fromJson(Map<String, dynamic> map) =>
      _$OutletModelFromJson(map);

  Map<String, dynamic> toJson() => _$OutletModelToJson(this);
}
