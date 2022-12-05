import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/features/movie/presentation/widgets/movie_search/movie_search_screen.dart';
import 'package:size_builder/size_builder.dart';

class TopSectionSearch extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TopSectionSearch({Key? key, this.title='MOVIES', required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return Padding(
      padding: EdgeInsets.all(Scaling.W(20)).copyWith(top: Scaling.H(40),bottom: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'SFProDisplay-Bold',
              fontSize: Scaling.S(24),
              color: const Color(0xff212121),
            ),
            softWrap: false,
          ),

          /// Search On Press Home Page
          ///
          IconButton(
            onPressed:onTap,
            icon: SvgPicture.asset(
              "assets/icons/search_icon.svg",
              height: Scaling.S(30),
            ),
          )
        ],
      ),
    );
  }
}
