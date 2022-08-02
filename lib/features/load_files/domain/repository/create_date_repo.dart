import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';

abstract class CreateDataRepo {
  createData(CarsEntity model, String documentId);
  updateData(CarsEntity model);
}
