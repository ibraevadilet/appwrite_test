import 'package:cars_appwrite/routes/routes.dart';
import 'package:cars_appwrite/theme/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: AppColors.grey,
      routes: const [
        LoadFilesScreenRoute(),
        HomeScreenRoute(),
        VideoScreenRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.mainColor,
        selectedItemColor: AppColors.white,
        unselectedFontSize: 12,
        unselectedItemColor: AppColors.inactive,
        unselectedIconTheme: const IconThemeData(color: AppColors.inactive),
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: [
          BottomNavigationBarItem(
              activeIcon: const Icon(Icons.add),
              icon: Icon(Icons.add, color: Colors.white.withOpacity(0.6)),
              label: 'add-delete'),
          BottomNavigationBarItem(
              activeIcon: const Icon(Icons.download),
              icon: Icon(Icons.download, color: Colors.white.withOpacity(0.6)),
              label: 'realtime'),
          BottomNavigationBarItem(
              activeIcon: const Icon(Icons.video_collection_outlined),
              icon: Icon(Icons.video_collection_outlined,
                  color: Colors.white.withOpacity(0.6)),
              label: 'video'),
        ],
      ),
    );
  }
}
