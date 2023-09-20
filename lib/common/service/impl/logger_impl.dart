import 'package:flutter/foundation.dart';

import '../intf/logger.dart';

class LoggerImpl extends Logger {
  final String? tag;

  LoggerImpl({this.tag});

  @override
  void debug(String message) {
    debugPrint(getTagPrefix() + message);
  }

  @override
  void error(error) {
    debugPrint("${getTagPrefix()}ERROR: $error");
  }

  @override
  void warn(String message) {
    debugPrint(getTagPrefix() + message);
  }

  String getTagPrefix() => tag != null ? "$tag: " : "";
}
