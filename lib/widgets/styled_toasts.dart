import 'package:cars_appwrite/main.dart';
import 'package:cars_appwrite/theme/text_styles.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(String text) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.f16w500,
        ),
      ),
    ),
  );
}

void showSuccessSnackBar(String text) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.f16w500,
        ),
      ),
    ),
  );
}
