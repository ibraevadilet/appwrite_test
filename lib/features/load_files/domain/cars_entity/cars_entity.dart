import 'package:cars_appwrite/features/load_files/data/models/cars_model/cars_model.dart';

class CarsEntity {
  CarsEntity(
      {required this.carsName,
      required this.engineVolume,
      required this.yearOfIssue,
       this.id});
  final String carsName;
  final String engineVolume;
  final int yearOfIssue;
  final String? id;

  CarsModel toModel() => CarsModel(
      carsName: carsName,
      engineVolume: engineVolume,
      yearOfIssue: yearOfIssue,);
}
