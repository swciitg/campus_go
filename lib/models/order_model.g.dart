// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['_id'] as String,
      outletID: json['outletID'] as String,
      userID: json['userID'] as String,
      orderMode: json['orderMode'] as String,
      instructions: json['instructions'] as String,
      items: (json['items'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as int),
          ) ??
          {},
      deliveryLocation: json['deliveryLocation'] as String,
      prepStatus: json['prepStatus'] as String,
      acceptanceStatus: json['acceptanceStatus'] as String,
      paymentStatus: json['paymentStatus'] as String,
      qrCodeSecret: json['qrCodeSecret'] as String,
      orderDateTime: DateTime.parse(json['orderDateTime'] as String),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'outletID': instance.outletID,
      'userID': instance.userID,
      'orderMode': instance.orderMode,
      'instructions': instance.instructions,
      'items': instance.items,
      'deliveryLocation': instance.deliveryLocation,
      'prepStatus': instance.prepStatus,
      'acceptanceStatus': instance.acceptanceStatus,
      'paymentStatus': instance.paymentStatus,
      'qrCodeSecret': instance.qrCodeSecret,
      'orderDateTime': instance.orderDateTime.toIso8601String(),
    };
