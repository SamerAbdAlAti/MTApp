import 'package:flutter/material.dart';
import 'package:movie/features/movie/presentation/widgets/now_playing_section.dart';
import 'package:size_builder/size_builder.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarBuild(),
      appBar: AppBar(),
    );
  }
}
