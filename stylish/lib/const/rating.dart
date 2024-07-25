import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBars extends StatelessWidget {
  const RatingBars({super.key, required this.star});
  final double star;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: RatingBarIndicator(
          itemCount: 5,
          itemSize: 18,
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
