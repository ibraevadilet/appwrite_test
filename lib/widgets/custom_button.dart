import 'package:cars_appwrite/theme/text_styles.dart';
import 'package:cars_appwrite/widgets/circular_loader.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.color,
    required this.onPress,
    Key? key,
    this.width = double.infinity,
    this.isLoading = false,
    this.padding = 14.0,
    this.height = 56,
    this.radius = 12.0,
    this.textStyle = AppTextStyles.f16w500,
  }) : super(key: key);
  final double width;
  final double height;
  final double padding;
  final Color color;
  final double radius;
  final bool isLoading;
  final TextStyle textStyle;
  final String text;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
          padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        onPressed: isLoading ? null : onPress,
        child: isLoading
            ? const AppIndicator()
            : Text(
                text,
                style: textStyle,
              ),
      ),
    );
  }
}
