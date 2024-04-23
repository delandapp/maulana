import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double starSize;
  final Color starColor;

  StarRating({this.rating = 0.0, this.starSize = 24.0, this.starColor = Colors.green});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          size: starSize,
          color: starColor,
        );
      }),
    );
  }
}