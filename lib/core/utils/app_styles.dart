import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_constance.dart';

abstract class AppStyles{

  //titleMedium
  static const TextStyle style16Grey = TextStyle(
    fontSize: 16,
    color: Colors.grey,
    fontFamily: AppConstance.appFontFamily,
  );

  //displayMedium
  static const TextStyle style16White = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontFamily: AppConstance.appFontFamily,

  );

  //bodyLarge
  static const TextStyle style30 = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: AppConstance.appFontFamily,

  );

  //bodyMedium
  static const TextStyle style20 = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontFamily: AppConstance.appFontFamily,

  );

  //bodySmall
  static const TextStyle style18 = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: AppConstance.appFontFamily,

  );

  //displaySmall
  static const TextStyle style14 = TextStyle(
      color: Colors.white,
      fontSize: 14,
    fontFamily: AppConstance.appFontFamily,

  );
}