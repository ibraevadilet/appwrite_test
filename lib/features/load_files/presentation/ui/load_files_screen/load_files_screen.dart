import 'package:cars_appwrite/features/load_files/presentation/bloc/load_data_cubit/load_data_cubit.dart';
import 'package:cars_appwrite/features/load_files/presentation/ui/load_files_screen/widgets/list_tile_widget.dart';
import 'package:cars_appwrite/routes/routes.dart';
import 'package:cars_appwrite/server/service_locator.dart';
import 'package:cars_appwrite/widgets/circular_loader.dart';
import 'package:cars_appwrite/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadFilesScreen extends StatelessWidget {
  const LoadFilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoadDataCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Все машины'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => context.router.push(
            CreateRedactorScreenRoute(
              title: 'Создать',
            ),
          ),
        ),
        body: BlocBuilder<LoadDataCubit, LoadDataState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const AppIndicator(),
              success: (model) => model.isEmpty
                  ? const Center(
                      child: Text('У вас нет машин'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 5),
                      itemCount: model.length,
                      itemBuilder: (context, index) => ListTileWidget(
                        id: model[index].id!,
                        name: model[index].carsName,
                        year: model[index].yearOfIssue.toString(),
                        volume: model[index].engineVolume,
                        onTap: () => context.router.push(
                          CreateRedactorScreenRoute(
                            model: model[index],
                            isRedactor: true,
                            title: 'Редактировать',
                          ),
                        ),
                      ),
                    ),
              error: (error) => AppErrorText(
                onPress: context.read<LoadDataCubit>().loadData(),
                text: error.message,
              ),
            );
          },
        ),
      ),
    );
  }
}
