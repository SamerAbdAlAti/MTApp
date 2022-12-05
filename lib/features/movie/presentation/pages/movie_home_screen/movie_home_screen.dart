import 'package:flutter/material.dart';
import 'package:movie/features/movie/presentation/widgets/movie_search/movie_search_screen.dart';

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
    return Scaffold(
      body: Column(
        children: [
          TopSectionSearch(onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MovieSearchScreen()));
          }),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  SizedBox(
                    height: Scaling.S(20),
                  ),
                  const SizedBox(child: TopRatedSection()),
                  const SizedBox(child: NowPlayingSection()),
                  const SizedBox(child: PopularSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
