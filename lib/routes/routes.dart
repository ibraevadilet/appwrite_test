import 'package:auto_route/auto_route.dart';
import 'package:cars_appwrite/features/auth/presentation/log_in/ui/log_in_screen.dart';
import 'package:cars_appwrite/features/auth/presentation/sign_up/ui/sign_up_screen.dart';
import 'package:cars_appwrite/features/home/presentation/ui/home_screen.dart';
import 'package:cars_appwrite/features/load_files/presentation/ui/create_files_screen/create_redactor_data_screen.dart';
import 'package:cars_appwrite/features/load_files/presentation/ui/load_files_screen/load_files_screen.dart';
import 'package:cars_appwrite/features/splash/splash_screen.dart';
import 'package:cars_appwrite/features/video/presentation/ui/video_screen.dart';
import 'package:cars_appwrite/widgets/bottom_navigation.dart';

export 'package:auto_route/auto_route.dart';

export 'routes.gr.dart';

@CupertinoAutoRouter(routes: [
  AdaptiveRoute(
    page: SplashScreen,
    initial: true,
    path: '/',
  ),
  AdaptiveRoute(
    page: SignUpScreen,
    path: '/sign_up',
  ),
  AdaptiveRoute(
    page: LogInScreen,
    path: '/log_in',
  ),
  AdaptiveRoute(
    page: CreateRedactorScreen,
    path: 'create',
  ),
  AdaptiveRoute(page: BottomNavigator, path: '/navigator', children: [
    AdaptiveRoute(
      page: HomeScreen,
      path: 'home',
    ),
    AdaptiveRoute(
      page: LoadFilesScreen,
      path: 'loadfiles',
    ),
    AdaptiveRoute(
      page: VideoScreen,
      path: 'video',
    ),
  ]),
])
class $MobileAppRouter {}
