import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:otus_food/common/extensions.dart';
import 'package:otus_food/common/res/app_colors.dart';

class Utils {
  static Future<void> showInfoSnackbar(String message,
      {SnackPosition? snackPosition}) async {
    await Get.snackbar(
      "",
      message,
      titleText: Container(),
      messageText: Text(message),
      colorText: AppColors.greenShade,
      backgroundColor: AppColors.greenShade.withOpacity(0.8),
      snackPosition: snackPosition ?? SnackPosition.TOP,
    ).future;
  }
}

AppLocalizations get l10n => Get.context!.l10n;
