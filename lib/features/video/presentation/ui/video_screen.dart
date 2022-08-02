import 'package:appwrite/appwrite.dart';
import 'package:cars_appwrite/features/video/presentation/bloc/video_cubit/video_cubit.dart';
import 'package:cars_appwrite/features/video/presentation/ui/widgets/chewie_list_item.dart';
import 'package:cars_appwrite/server/service_locator.dart';
import 'package:cars_appwrite/widgets/circular_loader.dart';
import 'package:cars_appwrite/widgets/error_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  InputFile? inputFile;
  addVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        inputFile =
            InputFile(path: file.path, filename: file.name, contentType: 'mp4');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VideoCubit>(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: addVideo, child: const Icon(Icons.add)),
        appBar: AppBar(
          title: const Text('Video Screen'),
        ),
        body: BlocBuilder<VideoCubit, VideoState>(
          builder: (context, state) {
            return state.when(
              loading: () => const AppIndicator(),
              error: (error) => AppErrorText(text: error.message),
              success: (ids) => SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Center(
                      child: Text(inputFile?.filename ?? 'Video Name'),
                    ),
                    inputFile?.filename != null
                        ? ElevatedButton(
                            onPressed: () => context
                                .read<VideoCubit>()
                                .saveVideo(inputFile!),
                            child: const Text('Save Video'))
                        : const SizedBox(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: ids.length,
                        itemBuilder: (context, index) => ChawieListItem(
                          videoPlayerController: VideoPlayerController.network(
                              // videoLocalUrl(ids[index])????
                              'https://user-images.githubusercontent.com/70715305/174163866-72e76540-1982-4e8a-bb40-383cf3ca2491.mp4'),
                          looping: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
