import 'package:equatable/equatable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'http_failure.dart';

abstract class Failure extends Equatable {
  const Failure();

  String getMessage(AppLocalizations strings);
}

class UnknownFailure extends Failure {
  final Object? error;
  final StackTrace? st;

  const UnknownFailure({
    this.error,
    this.st,
  });

  @override
  String getMessage(AppLocalizations strings) => strings.unknownError;

  @override
  List<Object?> get props => [
        error,
        st,
      ];
}
