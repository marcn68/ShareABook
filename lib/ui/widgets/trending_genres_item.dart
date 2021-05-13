import 'package:flutter/cupertino.dart';
import 'package:share_a_book/shared/constants.dart';

import 'custom_label.dart';

class TrendingGenresItem extends StatelessWidget {
  const TrendingGenresItem({
    Key key,
    @required this.trendingGenres,
    this.index,
  }) : super(key: key);

  final List<String> trendingGenres;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      color: Constants.PRIMARY_ORANGE,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      alignment: Alignment.center,
      child: CustomLabel(text: trendingGenres[index], fontSize: 22.0),
    );
  }
}