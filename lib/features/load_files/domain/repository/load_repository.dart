import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';

abstract class LoadRepository {
  Future<List<CarsEntity>> loadData();
   deleteData(String id);
}
