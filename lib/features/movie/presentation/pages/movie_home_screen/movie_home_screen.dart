import 'package:flutter/material.dart';
import 'package:movie/features/movie/presentation/widgets/now_playing_section.dart';
import 'package:movie/features/movie/presentation/widgets/top_section_search.dart';
import 'package:size_builder/size_builder.dart';

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({Key? key}) : super(key: key);

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);

    print("build");
    return Scaffold(


      /// ////////////////////////////////////////\

      body: SingleChildScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            TopSectionSearch(),
            SizedBox(child: TopRatedSection()),

            /// Basic import /// part from now Playing
            SizedBox(child: NowPlayingSection()),
            SizedBox(child: PopularSection()),
          ],
        ),
      ),
    );
  }
}

