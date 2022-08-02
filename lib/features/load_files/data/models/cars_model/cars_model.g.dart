// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CarsModel _$$_CarsModelFromJson(Map<String, dynamic> json) => _$_CarsModel(
      carsName: json['cars_name'] as String,
      engineVolume: json['engine_volume'] as String,
      yearOfIssue: json['year_of_issue'] as int,
      read:
          (json[r'$read'] as List<dynamic>?)?.map((e) => e as String).toList(),
      write:
          (json[r'$write'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] as int?,
      updatedAt: json[r'$updatedAt'] as int?,
      collection: json[r'$collection'] as String?,
    );

Map<String, dynamic> _$$_CarsModelToJson(_$_CarsModel instance) =>
    <String, dynamic>{
      'cars_name': instance.carsName,
      'engine_volume': instance.engineVolume,
      'year_of_issue': instance.yearOfIssue,
      r'$read': instance.read,
      r'$write': instance.write,
      r'$id': instance.id,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
      r'$collection': instance.collection,
    };
