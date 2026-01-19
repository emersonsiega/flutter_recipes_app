import 'dart:io';

import 'package:flutter_recipes_app/src/infra/logger/custom_printer.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

/// Default app logger
Logger logger = Logger(
  level: (() {
    try {
      return Platform.environment.containsKey('FLUTTER_TEST') ? Level.off : Level.debug;
    } catch (_) {
      // Platform/environment not available on web, default to debug
      return Level.debug;
    }
  })(),
  printer: CustomPrinter(
    methodCount: 0,
    errorMethodCount: 7,
    dateTimeFormat: (time) => DateFormat('dd-MM-yyyy HH:mm:ss').format(time),
  ),
);
