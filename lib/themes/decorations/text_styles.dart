import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle title = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontFamily: 'ChunkFive',
  );

  static const TextStyle subtitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w100,
    fontFamily: 'ChunkFive',
  );

  static const TextStyle body = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w100,
    fontFamily: 'ChunkFive',
  );

  static const TextStyle caption = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'ChunkFive',
    color: Colors.white,
  );

  static const TextStyle textFieldDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w100,
    fontFamily: 'ChunkFive',
    color: Colors.black,
  );

  static TextStyle presentation(double fontSize) => TextStyle(
    color: Colors.white,
    fontSize: fontSize,
    fontWeight: FontWeight.normal,
    fontFamily: 'ChunkFive',
  );
}
