import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:cars_appwrite/features/load_files/presentation/bloc/create_redactor_cubit/crate_redactor_cubit.dart';
import 'package:cars_appwrite/routes/routes.dart';
import 'package:cars_appwrite/server/service_locator.dart';
import 'package:cars_appwrite/theme/colors.dart';
import 'package:cars_appwrite/widgets/custom_button.dart';
import 'package:cars_appwrite/widgets/custom_text_field.dart';
import 'package:cars_appwrite/widgets/styled_toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRedactorScreen extends StatefulWidget {
  const CreateRedactorScreen(
      {required this.title, this.isRedactor = false, this.model, Key? key})
      : super(key: key);
  final String title;
  final bool isRedactor;
  final CarsEntity? model;

  @override
  State<CreateRedactorScreen> createState() => _CreateRedactorScreenState();
}

class _CreateRedactorScreenState extends State<CreateRedactorScreen> {
  late TextEditingController nameController;
  late TextEditingController yesrController;
  late TextEditingController volumeController;

  @override
  void initState() {
    nameController = TextEditingController(
        text: widget.isRedactor ? widget.model!.carsName : null);
    yesrController = TextEditingController(
        text: widget.isRedactor ? widget.model!.yearOfIssue.toString() : null);
    volumeController = TextEditingController(
        text: widget.isRedactor ? widget.model!.engineVolume : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} машину'),
      ),
      body: BlocProvider(
        create: (context) => sl<CrateRedactorCubit>(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text('Название машины:'),
              const SizedBox(height: 5),
              CustomTextField(
                  hintText: 'Введите название машины',
                  controller: nameController),
              const SizedBox(height: 23),
              const Text('Год выпуска:'),
              const SizedBox(height: 5),
              CustomTextField(
                  hintText: 'Введите год выпуска машины',
                  controller: yesrController),
              const SizedBox(height: 23),
              const Text('Объем двигателя:'),
              const SizedBox(height: 5),
              CustomTextField(
                  hintText: 'Введите объем двигателя',
                  controller: volumeController),
              const SizedBox(height: 23),
              BlocConsumer<CrateRedactorCubit, CrateRedactorState>(
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
                    text: widget.title,
                    color: AppColors.mainColor,
                    onPress: () => widget.isRedactor
                        ? context.read<CrateRedactorCubit>().redactorData(
                            CarsEntity(
                                carsName: nameController.text,
                                engineVolume: volumeController.text,
                                yearOfIssue: int.parse(yesrController.text),
                                id: widget.model!.id))
                        : context.read<CrateRedactorCubit>().createData(
                              CarsEntity(
                                carsName: nameController.text,
                                engineVolume: volumeController.text,
                                yearOfIssue: int.parse(yesrController.text),
                              ),
                            ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
