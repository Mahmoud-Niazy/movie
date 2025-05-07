import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppConstance {
  static  Color primaryBackgroundColor = const Color(0XFF121012);
  static const Color primaryColor = Color(0XFFF00034);
  static String apiKey = dotenv.env['API_KEY'] ?? '';
  static const String appFontFamily = 'Truculenta';
}


//0XFF141414


// 0XFFF31434




// new back 0XFF100004