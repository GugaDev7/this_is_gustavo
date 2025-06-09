import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle title = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontFamily: 'ChunkFive',
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'ChunkFive',
  );

  static const TextStyle body = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.normal,
    fontFamily: 'ChunkFive',
  );

  static const TextStyle caption = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'ChunkFive',
    color: Colors.white,
  );

  static TextStyle presentation(double fontSize) => TextStyle(
    color: Colors.white,
    fontSize: fontSize,
    fontWeight: FontWeight.normal,
    fontFamily: 'ChunkFive',
  );
}
