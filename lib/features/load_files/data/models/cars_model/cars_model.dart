import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cars_model.freezed.dart';
part 'cars_model.g.dart';

@freezed
class CarsModel with _$CarsModel {
  factory CarsModel({
    @JsonKey(name: 'cars_name') required String carsName,
    @JsonKey(name: 'engine_volume') required String engineVolume,
    @JsonKey(name: 'year_of_issue') required int yearOfIssue,
    @JsonKey(name: '\$read') List<String>? read,
    @JsonKey(name: '\$write') List<String>? write,
    @JsonKey(name: '\$id') String? id,
    @JsonKey(name: '\$createdAt') int? createdAt,
    @JsonKey(name: '\$updatedAt') int? updatedAt,
    @JsonKey(name: '\$collection') String? collection,
  }) = _CarsModel;

  factory CarsModel.fromJson(Map<String, dynamic> json) =>
      _$CarsModelFromJson(json);

  CarsModel._();

  CarsEntity toEntity() => CarsEntity(
        carsName: carsName,
        engineVolume: engineVolume,
        yearOfIssue: yearOfIssue,
        id: id,
      );
}
