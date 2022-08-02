import 'package:cars_appwrite/theme/colors.dart';
import 'package:cars_appwrite/theme/text_styles.dart';
import 'package:cars_appwrite/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AppErrorText extends StatelessWidget {
  const AppErrorText({
    required this.text,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final String text;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyles.f16w500,
            ),
            const SizedBox(height: 16),
            onPress != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 82),
                    child: CustomButton(
                        text: 'Повторить',
                        color: AppColors.mainColor,
                        onPress: onPress!),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
