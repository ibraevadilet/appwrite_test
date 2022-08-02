import 'package:cars_appwrite/features/home/domain/repository/real_time_repo.dart';
import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';

class RealTimeUseCase {
  RealTimeUseCase({required this.repo});
  final RealTimeRepo repo;
  List<CarsEntity> listData = [];
  Stream<List<CarsEntity>> realTime() async* {
    try {
      yield* repo.realTime();
    } catch (e) {
      rethrow;
    }
  }
}
