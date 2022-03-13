import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'constants.dart';
import 'game-object.dart';
import 'sprite.dart';

List<Sprite> CACTI = [
  Sprite(
    imagePath: 'assets/images/cacti/cacti_group.png',
    imageHeight: 104,
    imageWidth: 104,
  ),
  Sprite(
    imagePath: 'assets/images/cacti/cacti_large_1.png',
    imageWidth: 50,
    imageHeight: 100,
  ),
  Sprite(
    imagePath: 'assets/images/cacti/cacti_large_2.png',
    imageWidth: 98,
    imageHeight: 100,
  ),
  Sprite(
    imagePath: 'assets/images/cacti/cacti_small_1.png',
    imageHeight: 34,
    imageWidth: 70,
  ),
  Sprite(
      imagePath: 'assets/images/cacti/cacti_small_2.png',
      imageWidth: 68,
      imageHeight: 70),
  Sprite(
    imagePath: 'assets/images/cacti/cacti_small_3.png',
    imageHeight: 70,
    imageWidth: 107,
  ),
];

class Cactus extends GameObject {
  final Sprite sprite;
  final Offset worldLocation;

  Cactus({required this.worldLocation})
      : sprite = CACTI[Random().nextInt(CACTI.length)];

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * WORLD_TO_PIXEL_RATIO,
      screenSize.height / 2 - sprite.imageHeight,
      sprite.imageWidth.toDouble(),
      sprite.imageHeight.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(sprite.imagePath);
  }
}
