import 'package:cars_appwrite/theme/colors.dart';
import 'package:cars_appwrite/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ListTileForRealWidget extends StatelessWidget {
  const ListTileForRealWidget({
    required this.name,
    required this.year,
    required this.volume,
    required this.id,
    Key? key,
  }) : super(key: key);
  final String name;
  final String year;
  final String volume;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.of(context).size.width,
          height: 55,
          color: AppColors.blue.withOpacity(0.5),
          child: Row(
            children: [
              const Icon(Icons.car_rental),
              const SizedBox(width: 60),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: AppTextStyles.f16w500),
                  Text(year, style: AppTextStyles.f14w200),
                ],
              ),
              const Spacer(),
              Text(volume),
              const SizedBox(width: 30),
            ],
          ),
        ),
        const Divider(thickness: 1)
      ],
    );
  }
}
