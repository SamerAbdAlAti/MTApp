import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/manager/componants/constance.dart';

part 'on_boardings_state.dart';

class OnBoardingsCubit extends Cubit<OnBoardingsState> {
  OnBoardingsCubit() : super(const OnBoardingsState());


  @override
  Future<void> close() {
    onBoardingController.dispose();
    return super.close();
  }


  static OnBoardingsCubit get(context) => BlocProvider.of(context);

  final PageController onBoardingController = PageController();

  /// بيانات صفحة ال on Boarding
  final List<OnBoardingScreenChange> onBoardingList = [
    const OnBoardingScreenChange(
      imagePath: 'assets/images/Bitmap.png',
      title: "Get the first\nMovie &TV information",
      currentIndex: 0,
    ),
    const OnBoardingScreenChange(
      imagePath: 'assets/images/on_boarding_image_tow.png',
      title: "Know the movie\nis not worth Watching",
      currentIndex: 1,
    ),
    const OnBoardingScreenChange(
      imagePath: 'assets/images/on_boarding_image_three.png',
      title: "Real-time\nupdates movie Trailer",
      currentIndex: 2,
    ),
  ];

  void onBoardingItemCurrentIndexMethod({required int currentIndex}) {
    emit(OnBoardingsState(
        onBoardingItemCurrentIndex: currentIndex));
  }
}
