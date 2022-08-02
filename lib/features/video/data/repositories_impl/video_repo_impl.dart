import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cars_appwrite/core/constants/text_constants.dart';
import 'package:cars_appwrite/features/video/domain/repository/video_repo.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';

class VideoRepoImpl implements VideoRepo {
  VideoRepoImpl({required this.storage});
  final Storage storage;
  @override
  Future<FileList> getVideo() async {
    
    try {
      FileList fileList =
          await storage.listFiles(bucketId: AppTextConstants.bucketID);
      
      return fileList;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<File> saveVideo(InputFile file, String fileId) async {
    try {
      File fileList = await storage.createFile(
        bucketId: AppTextConstants.bucketID,
        fileId: fileId,
        file: file,
        read: ["role:all"],
        write: ["role:all"],
      );
      return fileList;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
