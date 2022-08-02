import 'package:appwrite/appwrite.dart';
import 'package:cars_appwrite/core/constants/text_constants.dart';
import 'package:cars_appwrite/features/auth/data/repositories_impl/log_in_repo_impl.dart';
import 'package:cars_appwrite/features/auth/data/repositories_impl/sign_in_repo_impl.dart';
import 'package:cars_appwrite/features/auth/domain/repository/log_in_repo.dart';
import 'package:cars_appwrite/features/auth/domain/repository/sign_in_repo.dart';
import 'package:cars_appwrite/features/auth/domain/use_case/log_in_use_case.dart';
import 'package:cars_appwrite/features/auth/domain/use_case/sign_in_use_case.dart';
import 'package:cars_appwrite/features/auth/presentation/log_in/bloc/cubit/log_in_cubit.dart';
import 'package:cars_appwrite/features/auth/presentation/sign_up/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:cars_appwrite/features/home/data/repositories_impl/real_time_repo_impl.dart';
import 'package:cars_appwrite/features/home/domain/repository/real_time_repo.dart';
import 'package:cars_appwrite/features/home/domain/use_case/real_time_use_case.dart';
import 'package:cars_appwrite/features/home/presentation/bloc/real_time_cubit/real_time_cubit.dart';
import 'package:cars_appwrite/features/load_files/data/repositories_impl/create_data_repo_impl.dart';
import 'package:cars_appwrite/features/load_files/data/repositories_impl/load_repo_impl.dart';
import 'package:cars_appwrite/features/load_files/domain/repository/create_date_repo.dart';
import 'package:cars_appwrite/features/load_files/domain/repository/load_repository.dart';
import 'package:cars_appwrite/features/load_files/domain/use_case/create_data_use_case.dart';
import 'package:cars_appwrite/features/load_files/domain/use_case/load_use_case.dart';
import 'package:cars_appwrite/features/load_files/presentation/bloc/create_redactor_cubit/crate_redactor_cubit.dart';
import 'package:cars_appwrite/features/load_files/presentation/bloc/load_data_cubit/load_data_cubit.dart';
import 'package:cars_appwrite/features/splash/cubit/splash_cubit.dart';
import 'package:cars_appwrite/features/video/data/repositories_impl/video_repo_impl.dart';
import 'package:cars_appwrite/features/video/domain/repository/video_repo.dart';
import 'package:cars_appwrite/features/video/domain/use_case/video_use_case.dart';
import 'package:cars_appwrite/features/video/presentation/bloc/video_cubit/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final client = Client();
  client
      .setEndpoint(AppTextConstants.endpoint)
      .setProject(AppTextConstants.projectId);

  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  sl.registerLazySingleton<Account>(
    () => Account(client),
  );
  sl.registerLazySingleton<Realtime>(
    () => Realtime(client),
  );
  sl.registerLazySingleton<Storage>(
    () => Storage(client),
  );

  sl.registerLazySingleton<Databases>(
    () => Databases(client, databaseId: AppTextConstants.databaseID),
  );

  /// Repository
  sl.registerLazySingleton<SignInRepo>(
    () => SignInRepoImpl(account: sl(), prefs: sl()),
  );

  sl.registerLazySingleton<LogInRepo>(
    () => LogInRepoImpl(account: sl(), prefs: sl()),
  );

  sl.registerLazySingleton<LoadRepository>(
    () => LoadRepoImpl(database: sl()),
  );
  sl.registerLazySingleton<CreateDataRepo>(
    () => CreateDataRepoImpl(database: sl()),
  );

  sl.registerLazySingleton<RealTimeRepo>(
    () => RealTimeRepoImpl(realtime: sl()),
  );
  sl.registerLazySingleton<VideoRepo>(
    () => VideoRepoImpl(storage: sl()),
  );

  /// UseCases
  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton<LogInUseCase>(
    () => LogInUseCase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton<LoadUseCase>(
    () => LoadUseCase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton<CreateDataUseCase>(
    () => CreateDataUseCase(
      repo: sl(),
    ),
  );

  sl.registerLazySingleton<RealTimeUseCase>(
    () => RealTimeUseCase(
      repo: sl(),
    ),
  );

  sl.registerLazySingleton<VideoUseCase>(
    () => VideoUseCase(
      repo: sl(),
    ),
  );

  /// BLoCs / Cubits
  sl.registerFactory(
    () => SplashCubit(
      prefs: sl(),
    ),
  );

  sl.registerFactory(
    () => SignInCubit(
      usecase: sl(),
    ),
  );

  sl.registerFactory(
    () => LogInCubit(
      usecase: sl(),
    ),
  );
  sl.registerFactory(
    () => LoadDataCubit(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => CrateRedactorCubit(
      usecase: sl(),
    ),
  );
  sl.registerFactory(
    () => RealTimeCubit(
      usecase: sl(),
    ),
  );

  sl.registerFactory(
    () => VideoCubit(
      usecase: sl(),
    ),
  );
}
