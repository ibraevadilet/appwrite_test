import 'dart:math';

import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:cars_appwrite/features/load_files/domain/repository/create_date_repo.dart';

class CreateDataUseCase {
  CreateDataUseCase({required this.repo});
  final CreateDataRepo repo;

  createData(CarsEntity model) async {
    int id = Random().nextInt(999999999) + 111111111;
    String documentId = 'document_id_$id';

    try {
      final responce = await repo.createData(model, documentId);
      return responce;
    } catch (e) {
      rethrow;
    }
  }

  updateData(CarsEntity model) async {
    try {
      final responce = await repo.updateData(model);
      return responce;
    } catch (e) {
      rethrow;
    }
  }
}
