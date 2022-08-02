import 'package:cars_appwrite/features/home/presentation/bloc/real_time_cubit/real_time_cubit.dart';
import 'package:cars_appwrite/features/home/presentation/ui/widgets/list_tile_for_real.dart';
import 'package:cars_appwrite/server/service_locator.dart';
import 'package:cars_appwrite/widgets/circular_loader.dart';
import 'package:cars_appwrite/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RealTimeCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Реалтайм машины'),
        ),
        body: BlocBuilder<RealTimeCubit, RealTimeState>(
          builder: (context, state) {
            return state.when(
              initial: () =>
                  const Center(child: Text('Создайте авто в консоли')),
              loading: () => const AppIndicator(),
              success: (model) => model.isEmpty
                  ? const Center(
                      child: Text('Нет авто'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 5),
                      itemCount: model.length,
                      itemBuilder: (context, index) => ListTileForRealWidget(
                        id: model[index].id!,
                        name: model[index].carsName,
                        year: model[index].yearOfIssue.toString(),
                        volume: model[index].engineVolume,
                      ),
                    ),
              error: (error) => AppErrorText(
                onPress: context.read<RealTimeCubit>().realTime(),
                text: error.message,
              ),
            );
          },
        ),
      ),
    );
  }
}
