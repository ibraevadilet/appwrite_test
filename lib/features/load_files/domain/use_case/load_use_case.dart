import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:cars_appwrite/features/load_files/domain/repository/load_repository.dart';

class LoadUseCase {
  LoadUseCase({required this.repo});
  final LoadRepository repo;
  List<CarsEntity> listData = [];
  Future<List<CarsEntity>> loadData() async {
    try {
      final responce = await repo.loadData();
      listData = responce;
      return responce;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CarsEntity>> deleteData(String id) async {
    try {
      await repo.deleteData(id);
      listData.removeWhere((element) => element.id == id);
      return listData;
    } catch (e) {
      rethrow;
    }
  }
}
