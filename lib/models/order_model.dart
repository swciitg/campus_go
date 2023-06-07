import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {
  @JsonKey(name: '_id')
  final String outletID;
  final String userID;
  final String orderMode;
  final String instructions;
  @JsonKey(defaultValue: [])
  final List<String> items;
  final String deliveryLocation;
  final String prepStatus;
  final String acceptanceStatus;
  final String paymentStatus;
  final String qrCodeSecret;
  final DateTime orderDateTime;

  OrderModel(
      {required this.outletID,
      required this.userID,
      required this.orderMode,
      required this.instructions,
      required this.items,
      required this.deliveryLocation,
      required this.prepStatus,
      required this.acceptanceStatus,
      required this.paymentStatus,
      required this.qrCodeSecret,required this.orderDateTime,});
  factory OrderModel.fromJson(Map<String, dynamic> map) =>
      _$OrderModelFromJson(map);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
