import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'you_tube_player_state.dart';

class YouTubePlayerCubit extends Cubit<YouTubePlayerState> {
  YouTubePlayerCubit() : super(const YouTubePlayerState());

  @override
  Future<void> close() {
    youtubePlayerController.dispose();
    return super.close();
  }

  static YouTubePlayerCubit get(context) => BlocProvider.of(context);

  late YoutubePlayerController youtubePlayerController;

  // void youtubePlayerControllerMethod({required String videoKeyIndex}) {
  //   youtubePlayerController.updateValue(YoutubePlayerValue(isReady: true));
  // }

  void updateVideoKey({required String videoKey}) {
    if (youtubePlayerController.value.isReady) {
      youtubePlayerController.load(videoKey);
    } else {
      youtubePlayerController.value.errorCode;
    }
  }

  void youTubePlayerRequestsMethod({required String videoKeyMethod}) {
    emit(state.copyWith(youTubePlayerState: RequestsState.loading));
    youtubePlayerController.load(videoKeyMethod);
    emit(state.copyWith(youTubePlayerState: RequestsState.loaded));
  }
}
