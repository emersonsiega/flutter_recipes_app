import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';
import 'package:omni_video_player/omni_video_player.dart';

class VideoPlayer extends StatefulWidget {
  final Uri videoUrl;
  const VideoPlayer({super.key, required this.videoUrl});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return OmniVideoPlayer(
      configuration: VideoPlayerConfiguration(
        customPlayerWidgets: CustomPlayerWidgets(
          loadingWidget: ColoredBox(
            color: Colors.black.withValues(alpha: 0.4),
            child: const Center(child: CircularProgressIndicator()),
          ),
          errorPlaceholder: ColoredBox(
            color: context.colorScheme.errorContainer,
            child: Center(
              child: Text(
                t.videoPlayer.errorLoadingVideo,
                textAlign: .center,
                style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onErrorContainer),
              ),
            ),
          ),
        ),
        playerTheme: OmniVideoPlayerThemeData(
          colors: VideoPlayerColorScheme(
            active: context.colorScheme.primary,
          ),
        ),
        videoSourceConfiguration: VideoSourceConfiguration.youtube(
          videoUrl: widget.videoUrl,
          enableYoutubeWebViewFallback: true,
        ),
      ),
      callbacks: VideoPlayerCallbacks(),
    );
  }
}
