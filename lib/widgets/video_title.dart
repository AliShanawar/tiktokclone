// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tiktokclone/model/video.dart';
import 'package:video_player/video_player.dart';

class VideoTite extends StatefulWidget {
  const VideoTite(
      {Key? key,
      required this.video,
      required this.sanppedPageIndex,
      required this.currentIndex})
      : super(key: key);
  final Video video;
  final int sanppedPageIndex;
  final int currentIndex;

  @override
  _VideoTiteState createState() => _VideoTiteState();
}

class _VideoTiteState extends State<VideoTite> {
  late VideoPlayerController _VideoController;
  late Future _initializeVideoPlayer;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    _VideoController =
        VideoPlayerController.asset('assets/${widget.video.videoUrl}');
    _initializeVideoPlayer = _VideoController.initialize();
    _VideoController.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _VideoController.dispose();
    super.dispose();
  }

  void _pausePlayVideo() {
    _isVideoPlaying ? _VideoController.pause() : _VideoController.play();
    setState(() {
      _isVideoPlaying = !_isVideoPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    (widget.sanppedPageIndex == widget.currentIndex && _isVideoPlaying)
        ? _VideoController.play()
        : _VideoController.pause();
    return Container(
        color: Colors.black,
        child: FutureBuilder(
            future: _initializeVideoPlayer,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GestureDetector(
                  onTap: () => {_pausePlayVideo()},
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(_VideoController),
                      IconButton(
                        onPressed: () => {_pausePlayVideo()},
                        icon: Icon(
                          Icons.play_arrow,
                          color: Colors.white
                              .withOpacity(_isVideoPlaying ? 0 : 0.5),
                          size: 60,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: Lottie.asset('wait',
                      width: 100, height: 100, fit: BoxFit.cover),
                );
              }
            }));
  }
}
