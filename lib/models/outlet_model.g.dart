// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutletModel _$OutletModelFromJson(Map<String, dynamic> json) => OutletModel(
      outletName: json['outletName'] as String,
      location: json['location'] as String,
      phoneNumber: json['phoneNumber'] as String,
      category: json['category'] as String,
      status: json['status'] as bool,
      outletKey: json['outletKey'] as String,
      id: json['_id'] as String,
      service: (json['service'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$OutletModelToJson(OutletModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'outletName': instance.outletName,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'category': instance.category,
      'status': instance.status,
      'outletKey': instance.outletKey,
      'service': instance.service,
    };
