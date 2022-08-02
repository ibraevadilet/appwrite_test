import 'package:cars_appwrite/core/images/images.dart';
import 'package:cars_appwrite/features/splash/cubit/splash_cubit.dart';
import 'package:cars_appwrite/routes/routes.dart';
import 'package:cars_appwrite/server/service_locator.dart';
import 'package:cars_appwrite/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SplashCubit>(
        create: (context) => sl<SplashCubit>(),
        child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            state.whenOrNull(
              authenticated: () => context.router.pushAndPopUntil(
                const LogInScreenRoute(),
                predicate: (route) => false,
              ),
              unauthenticated: () => context.router.pushAndPopUntil(
                const SignUpScreenRoute(),
                predicate: (route) => false,
              ),
            );
          },
          builder: (context, state) {
            return SafeArea(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Interesting cars',
                      style: AppTextStyles.f30wbold,
                    ),
                    const SizedBox(height: 23),
                    Image.asset(
                      AppImages.logo,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
