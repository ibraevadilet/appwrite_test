import 'package:appwrite/appwrite.dart';
import 'package:cars_appwrite/core/constants/text_constants.dart';
import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:cars_appwrite/features/load_files/domain/repository/create_date_repo.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';

class CreateDataRepoImpl implements CreateDataRepo {
  CreateDataRepoImpl({required this.database});
  final Databases database;
  @override
  createData(CarsEntity model, String documentId) async {
    try {
      await database.createDocument(
        collectionId: AppTextConstants.collectionID,
        documentId: documentId,
        data: model.toModel().toJson(),
        read: ["role:all"],
        write: ["role:all"],
      );
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  updateData(CarsEntity model) async {
    try {
      await database.updateDocument(
        collectionId: AppTextConstants.collectionID,
        documentId: model.id!,
        data: model.toModel().toJson(),
        read: ["role:all"],
        write: ["role:all"],
      );
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
