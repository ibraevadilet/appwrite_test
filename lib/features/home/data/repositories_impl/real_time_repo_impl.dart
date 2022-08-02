import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:cars_appwrite/core/constants/text_constants.dart';
import 'package:cars_appwrite/features/home/domain/repository/real_time_repo.dart';
import 'package:cars_appwrite/features/load_files/data/models/cars_model/cars_model.dart';
import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';

class RealTimeRepoImpl implements RealTimeRepo {
  RealTimeRepoImpl({required this.realtime});
  final Realtime realtime;

  final _controller = StreamController<List<CarsEntity>>();
  @override
  Stream<List<CarsEntity>> realTime() async* {
    List<CarsEntity> listModel = [];

    try {
      RealtimeSubscription subscripption = realtime.subscribe([
        'databases.${AppTextConstants.databaseID}.collections.${AppTextConstants.collectionID}.documents'
      ]);
      subscripption.stream.listen(
        (response) {
          if (response.events.contains(AppTextConstants.createStream)) {
            listModel.add(CarsModel.fromJson(response.payload).toEntity());
            _controller.add(listModel);
          } else if (response.events.contains(AppTextConstants.deleteStream)) {
            listModel
                .removeWhere((item) => item.id == response.payload['\$id']);
            _controller.add(listModel);
          } else if (response.events.contains(AppTextConstants.updateStream)) {
            listModel[listModel.indexWhere(
                    (element) => element.id == response.payload['\$id'])] =
                CarsModel.fromJson(response.payload).toEntity();
            _controller.add(listModel);
          }
        },
      );
      yield* _controller.stream;
    } catch (error) {
      throw CatchException.convertException(error);
    }
  }
}
