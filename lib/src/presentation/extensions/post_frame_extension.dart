import 'package:flutter/material.dart';

extension PostFrameExtension on State {
  void postFrame(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
