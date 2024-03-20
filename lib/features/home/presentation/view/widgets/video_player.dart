import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/utils/app_constance.dart';

class VideoPlayer extends StatelessWidget {
  final String movieId;

  const VideoPlayer({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController videoController = YoutubePlayerController(
      initialVideoId: movieId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    return YoutubePlayer(
      thumbnail: Container(),
      liveUIColor: AppConstance.primaryColor,
      controller: videoController,
      showVideoProgressIndicator: true,
      progressIndicatorColor: AppConstance.primaryColor,
      progressColors: const ProgressBarColors(
        playedColor: AppConstance.primaryColor,
        handleColor: AppConstance.primaryColor,
      ),
      onReady: () {
        videoController.addListener(() {});
      },
    );
  }
}
