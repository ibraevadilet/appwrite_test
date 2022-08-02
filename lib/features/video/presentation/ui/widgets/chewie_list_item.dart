import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChawieListItem extends StatefulWidget {
  const ChawieListItem(
      {required this.videoPlayerController, Key? key, this.looping = false})
      : super(key: key);
  final VideoPlayerController videoPlayerController;
  final bool looping;
  @override
  State<ChawieListItem> createState() => _ChawieListItemState();
}

class _ChawieListItemState extends State<ChawieListItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: false,
      looping: true,
      errorBuilder: (context, error) => Center(
        child: Text(
          error,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        height: 230,
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
