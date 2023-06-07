import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String price;
  final String category;
  final String offeringOutlet;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.offeringOutlet,
  });
  factory ItemModel.fromJson(Map<String, dynamic> map) =>
      _$ItemModelFromJson(map);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
