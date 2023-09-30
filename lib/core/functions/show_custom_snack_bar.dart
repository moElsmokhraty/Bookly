import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly/core/utils/styles.dart';

void showCustomSnackBar(BuildContext context, String text) {

  if (Platform.isAndroid) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey[800],
        content: Text(
          text,
          style: Styles.textStyle16,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  } else {
    showCupertinoModalPopup(
      barrierDismissible: true,
      barrierColor: Colors.grey[800]!,
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text(
          'Error',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        message: Text(
          text,
          style: Styles.textStyle16,
        ),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => GoRouter.of(context).pop(),
          child: const Text('OK'),
        ),
      ),
    );
  }
}
