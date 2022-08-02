import 'package:cars_appwrite/core/constants/text_constants.dart';
import 'package:cars_appwrite/features/auth/presentation/sign_up/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:cars_appwrite/routes/routes.dart';
import 'package:cars_appwrite/server/service_locator.dart';
import 'package:cars_appwrite/theme/colors.dart';
import 'package:cars_appwrite/theme/text_styles.dart';
import 'package:cars_appwrite/widgets/custom_button.dart';
import 'package:cars_appwrite/widgets/custom_text_field.dart';
import 'package:cars_appwrite/widgets/styled_toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (_) => sl<SignInCubit>(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppTextConstants.signin,
                  style: AppTextStyles.f30wbold,
                ),
                const SizedBox(height: 50),
                const Text(AppTextConstants.enterName),
                const SizedBox(height: 10),
                CustomTextField(
                    hintText: AppTextConstants.name,
                    controller: nameController),
                const SizedBox(height: 23),
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
                BlocConsumer<SignInCubit, SignInState>(
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
                      text: 'Зарегистрироваться',
                      color: AppColors.mainColor,
                      onPress: () => context.read<SignInCubit>().signIn(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () =>
                              context.router.push(const LogInScreenRoute()),
                          child: const Text(
                            'Уже есть аккаунт?',
                            style: AppTextStyles.f16w500BlueUnder,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
