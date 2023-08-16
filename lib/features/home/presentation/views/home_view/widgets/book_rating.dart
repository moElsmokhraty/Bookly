import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {Key? key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.ratesCount})
      : super(key: key);

  final MainAxisAlignment mainAxisAlignment;

  final dynamic rating;

  final num ratesCount;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: mainAxisAlignment, children: [
      const Icon(FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F), size: 15),
      const SizedBox(width: 7.0),
      Text('$rating', style: Styles.textStyle16),
      const SizedBox(width: 7.0),
      Text('($ratesCount)', style: Styles.textStyle14),
    ]);
  }
}
