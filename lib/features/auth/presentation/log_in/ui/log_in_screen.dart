import 'package:cars_appwrite/core/constants/text_constants.dart';
import 'package:cars_appwrite/features/auth/presentation/log_in/bloc/cubit/log_in_cubit.dart';
import 'package:cars_appwrite/routes/routes.dart';
import 'package:cars_appwrite/server/service_locator.dart';
import 'package:cars_appwrite/theme/colors.dart';
import 'package:cars_appwrite/theme/text_styles.dart';
import 'package:cars_appwrite/widgets/custom_button.dart';
import 'package:cars_appwrite/widgets/custom_text_field.dart';
import 'package:cars_appwrite/widgets/styled_toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => sl<LogInCubit>(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  AppTextConstants.login,
                  style: AppTextStyles.f30wbold,
                ),
                const SizedBox(height: 50),
                const Text(AppTextConstants.enterEmail),
                const SizedBox(height: 10),
                CustomTextField(
                    hintText: AppTextConstants.email,
                    controller: emailController),
                const SizedBox(height: 23),
                const Text(AppTextConstants.enterPassword),
                const SizedBox(height: 10),
                CustomTextField(
                    hintText: AppTextConstants.password,
                    controller: passwordController),
                const SizedBox(height: 23),
                BlocConsumer<LogInCubit, LogInState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      error: (message) => showErrorSnackBar(message.message),
                      success: () => context.router.pushAndPopUntil(
                        const BottomNavigatorRoute(),
                        predicate: (route) => false,
                      ),
                    );
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      text: 'Войти',
                      color: AppColors.mainColor,
                      onPress: () => context.read<LogInCubit>().logIn(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
