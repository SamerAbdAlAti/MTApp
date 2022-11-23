import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:size_builder/size_builder.dart';

class TopSectionSearch extends StatelessWidget {
  const TopSectionSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return Padding(
      padding: EdgeInsets.all(Scaling.W(20)).copyWith(top: Scaling.H(80)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'MOVIES',
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
            onPressed: () {},
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
