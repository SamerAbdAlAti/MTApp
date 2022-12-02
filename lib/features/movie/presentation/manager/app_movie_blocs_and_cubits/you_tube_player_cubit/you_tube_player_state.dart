part of 'you_tube_player_cubit.dart';

class YouTubePlayerState extends Equatable {
  final String videoPlayerKey;
  final RequestsState youTubePlayerState;
  final String videoId;

  const YouTubePlayerState({
    this.videoPlayerKey = '',
    this.youTubePlayerState = RequestsState.loaded,
    this.videoId = '',
  });

  YouTubePlayerState copyWith({
    String? videoPlayerKey,
    RequestsState? youTubePlayerState,
    String? videoId,
  }) {
    return YouTubePlayerState(
      videoPlayerKey: videoPlayerKey ?? this.videoPlayerKey,
      youTubePlayerState: youTubePlayerState ?? this.youTubePlayerState,
      videoId: videoId ?? this.videoId,
    );
  }

  @override
  List<Object> get props => [videoPlayerKey, youTubePlayerState];
}
