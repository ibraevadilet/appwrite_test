import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:cars_appwrite/features/video/domain/repository/video_repo.dart';

class VideoUseCase {
  VideoUseCase({required this.repo});
  final VideoRepo repo;
  List<String> ids = [];
  Future<List<String>> getVideo() async {
    try {
      final responce = await repo.getVideo();
      responce.files.map((e) => ids.add(e.$id)).toList();
      return ids;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> saveVideo(InputFile file) async {
    int id = Random().nextInt(999999999) + 111111111;
    String fileId = 'file_id_$id';
    try {
      final responce = await repo.saveVideo(file, fileId);
      ids.add(responce.$id);
      print(ids);
      return ids;
    } catch (e) {
      rethrow;
    }
  }
}
