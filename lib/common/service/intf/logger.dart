import '../impl/logger_impl.dart';

abstract class Logger {
  void debug(String message);

  void warn(String message);

  void error(dynamic error);

  static Logger create(String tag) => LoggerImpl(tag: tag);
}
