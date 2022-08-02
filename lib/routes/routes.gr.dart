// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../features/auth/presentation/log_in/ui/log_in_screen.dart' as _i3;
import '../features/auth/presentation/sign_up/ui/sign_up_screen.dart' as _i2;
import '../features/home/presentation/ui/home_screen.dart' as _i6;
import '../features/load_files/domain/cars_entity/cars_entity.dart' as _i11;
import '../features/load_files/presentation/ui/create_files_screen/create_redactor_data_screen.dart'
    as _i4;
import '../features/load_files/presentation/ui/load_files_screen/load_files_screen.dart'
    as _i7;
import '../features/splash/splash_screen.dart' as _i1;
import '../features/video/presentation/ui/video_screen.dart' as _i8;
import '../widgets/bottom_navigation.dart' as _i5;

class MobileAppRouter extends _i9.RootStackRouter {
  MobileAppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    SignUpScreenRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SignUpScreen());
    },
    LogInScreenRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.LogInScreen());
    },
    CreateRedactorScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CreateRedactorScreenRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.CreateRedactorScreen(
              title: args.title,
              isRedactor: args.isRedactor,
              model: args.model,
              key: args.key));
    },
    BottomNavigatorRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.BottomNavigator());
    },
    HomeScreenRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.HomeScreen());
    },
    LoadFilesScreenRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.LoadFilesScreen());
    },
    VideoScreenRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.VideoScreen());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i9.RouteConfig(SignUpScreenRoute.name, path: '/sign_up'),
        _i9.RouteConfig(LogInScreenRoute.name, path: '/log_in'),
        _i9.RouteConfig(CreateRedactorScreenRoute.name, path: 'create'),
        _i9.RouteConfig(BottomNavigatorRoute.name,
            path: '/navigator',
            children: [
              _i9.RouteConfig(HomeScreenRoute.name,
                  path: 'home', parent: BottomNavigatorRoute.name),
              _i9.RouteConfig(LoadFilesScreenRoute.name,
                  path: 'loadfiles', parent: BottomNavigatorRoute.name),
              _i9.RouteConfig(VideoScreenRoute.name,
                  path: 'video', parent: BottomNavigatorRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i9.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.SignUpScreen]
class SignUpScreenRoute extends _i9.PageRouteInfo<void> {
  const SignUpScreenRoute() : super(SignUpScreenRoute.name, path: '/sign_up');

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i3.LogInScreen]
class LogInScreenRoute extends _i9.PageRouteInfo<void> {
  const LogInScreenRoute() : super(LogInScreenRoute.name, path: '/log_in');

  static const String name = 'LogInScreenRoute';
}

/// generated route for
/// [_i4.CreateRedactorScreen]
class CreateRedactorScreenRoute
    extends _i9.PageRouteInfo<CreateRedactorScreenRouteArgs> {
  CreateRedactorScreenRoute(
      {required String title,
      bool isRedactor = false,
      _i11.CarsEntity? model,
      _i10.Key? key})
      : super(CreateRedactorScreenRoute.name,
            path: 'create',
            args: CreateRedactorScreenRouteArgs(
                title: title, isRedactor: isRedactor, model: model, key: key));

  static const String name = 'CreateRedactorScreenRoute';
}

class CreateRedactorScreenRouteArgs {
  const CreateRedactorScreenRouteArgs(
      {required this.title, this.isRedactor = false, this.model, this.key});

  final String title;

  final bool isRedactor;

  final _i11.CarsEntity? model;

  final _i10.Key? key;

  @override
  String toString() {
    return 'CreateRedactorScreenRouteArgs{title: $title, isRedactor: $isRedactor, model: $model, key: $key}';
  }
}

/// generated route for
/// [_i5.BottomNavigator]
class BottomNavigatorRoute extends _i9.PageRouteInfo<void> {
  const BottomNavigatorRoute({List<_i9.PageRouteInfo>? children})
      : super(BottomNavigatorRoute.name,
            path: '/navigator', initialChildren: children);

  static const String name = 'BottomNavigatorRoute';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreenRoute extends _i9.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i7.LoadFilesScreen]
class LoadFilesScreenRoute extends _i9.PageRouteInfo<void> {
  const LoadFilesScreenRoute()
      : super(LoadFilesScreenRoute.name, path: 'loadfiles');

  static const String name = 'LoadFilesScreenRoute';
}

/// generated route for
/// [_i8.VideoScreen]
class VideoScreenRoute extends _i9.PageRouteInfo<void> {
  const VideoScreenRoute() : super(VideoScreenRoute.name, path: 'video');

  static const String name = 'VideoScreenRoute';
}
