import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cars_appwrite/core/constants/text_constants.dart';
import 'package:cars_appwrite/features/load_files/data/models/cars_model/cars_model.dart';
import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:cars_appwrite/features/load_files/domain/repository/load_repository.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';

class LoadRepoImpl implements LoadRepository {
  LoadRepoImpl({required this.database});
  final Databases database;
  @override
  Future<List<CarsEntity>> loadData() async {
    try {
      DocumentList documentList = await database.listDocuments(
        collectionId: AppTextConstants.collectionID,
      );
      return documentList.documents
          .map<CarsEntity>((e) => CarsModel.fromJson(e.data).toEntity())
          .toList();
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  deleteData(String id) async {
    try {
      await database.deleteDocument(
          collectionId: AppTextConstants.collectionID, documentId: id);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
