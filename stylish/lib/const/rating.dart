import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBars extends StatelessWidget {
  const RatingBars(
      {super.key, required this.star, this.size = 14.0, this.margin});
  final double star;
  final double size;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: RatingBarIndicator(
          itemCount: 5,
          itemSize: size,
          rating: star,
          direction: Axis.horizontal,
          itemBuilder: (context, _) {
            return const Icon(
              Icons.star,
              color: Color.fromARGB(255, 238, 184, 8),
            );
          }),
    );
  }
}
