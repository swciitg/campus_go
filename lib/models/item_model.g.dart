// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      category: json['category'] as String,
      offeringOutlet: json['offeringOutlet'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'category': instance.category,
      'offeringOutlet': instance.offeringOutlet,
    };
