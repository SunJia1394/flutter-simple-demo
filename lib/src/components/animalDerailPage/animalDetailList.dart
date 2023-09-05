import 'package:flutter/material.dart';
import 'animalDetailListItem.dart';

class AdaptiveImageGrid extends StatelessWidget {
  final List<String> images;
  final double spacing;

  const AdaptiveImageGrid({required this.images, this.spacing = 10});

  @override
  Widget build(BuildContext context) {

    final List<String> shuffledImages = [...images]..shuffle();

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                  children: shuffledImages.map((image) => AnimalDetailListItem(image: image))
                      .toList())),
        ),
        Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                  children: images
                      .map((image) => AnimalDetailListItem(image: image))
                      .toList())),
        ),
      ],
    );
  }
}
