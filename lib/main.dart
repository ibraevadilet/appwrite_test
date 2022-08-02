import 'package:cars_appwrite/routes/routes.dart';
import 'package:cars_appwrite/routes/routes.gr.dart';
import 'package:cars_appwrite/widgets/app_unfocuser.dart';
import 'package:cars_appwrite/widgets/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:cars_appwrite/server/service_locator.dart' as di;

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final appRouter = MobileAppRouter();

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Builder(
        builder: (context) => MaterialApp.router(
          scrollBehavior: AppScrollBehavior(),
          scaffoldMessengerKey: scaffoldKey,
          title: 'Cars Appwrite',
          debugShowCheckedModeBanner: false,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
          routeInformationProvider: appRouter.routeInfoProvider(),
        ),
      ),
    );
  }
}
