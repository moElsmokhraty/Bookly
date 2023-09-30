import 'package:flutter/services.dart';
import 'package:bookly/constants.dart';

void setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}