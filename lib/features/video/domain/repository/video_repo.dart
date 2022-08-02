import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

abstract class VideoRepo {
 Future<FileList> getVideo();
  Future<File> saveVideo(InputFile file, String fileId);
}
