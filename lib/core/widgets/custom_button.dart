import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bookly/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.backGroundColor,
    required this.textColor,
    this.borderRadius,
    required this.text,
    this.fontSize,
    this.onPressed,
  }) : super(key: key);

  final String text;

  final Color backGroundColor;

  final Color textColor;

  final double? fontSize;

  final BorderRadius? borderRadius;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Platform.isAndroid
          ? ElevatedButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: backGroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(16),
                ),
              ),
              child: Text(
                text,
                style: Styles.textStyle18.copyWith(
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            )
          : CupertinoButton(
              onPressed: onPressed,
              color: backGroundColor,
              borderRadius: borderRadius ?? BorderRadius.circular(16),
              child: Text(
                text,
                style: Styles.textStyle18.copyWith(
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
    );
  }
}
