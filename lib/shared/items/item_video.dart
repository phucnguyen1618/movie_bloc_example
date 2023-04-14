import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_api/response/video_response.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ItemVideo extends StatefulWidget {
  final Results results;

  const ItemVideo({Key? key, required this.results}) : super(key: key);

  @override
  State<ItemVideo> createState() => _ItemVideoState();
}

class _ItemVideoState extends State<ItemVideo> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.results.key ?? 'nPt8bK2gbaU',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
        loop: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    super.initState();
  }

  @override
  void deactivate() {
    _youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _youtubePlayerController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () {},
        onEnded: (data) {},
        bottomActions: [
          const SizedBox(width: 14.0),
          CurrentPosition(),
          const SizedBox(width: 8.0),
          ProgressBar(isExpanded: true),
          RemainingDuration(),
          const PlaybackSpeedButton(),
        ],
      ),
      builder: (context, player) {
        return player;
      },
    );
  }
}
