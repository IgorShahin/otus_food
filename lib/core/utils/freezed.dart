import 'package:freezed_annotation/freezed_annotation.dart';

const requestFreezed = Freezed(
  toJson: true,
  fromJson: false,
);

const responseFreezed = Freezed(
  toJson: false,
  fromJson: true,
);
