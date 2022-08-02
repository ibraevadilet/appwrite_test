import 'package:cars_appwrite/features/load_files/presentation/bloc/load_data_cubit/load_data_cubit.dart';
import 'package:cars_appwrite/theme/colors.dart';
import 'package:cars_appwrite/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    required this.name,
    required this.year,
    required this.volume,
    required this.onTap,
    required this.id,
    Key? key,
  }) : super(key: key);
  final String name;
  final String year;
  final String volume;
  final Function() onTap;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
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
                IconButton(
                  onPressed: () {
                    context.read<LoadDataCubit>().deleteData(id);
                    // context.router.pushAndPopUntil(
                    //   const BottomNavigatorRoute(),
                    //   predicate: (route) => false,
                    // );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
        const Divider(thickness: 1)
      ],
    );
  }
}
