import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otus_food/core/res/app_assets.dart';

class FailureContainer extends StatelessWidget {
  const FailureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.iconFailure, width: 196, height: 188),
        const SizedBox(height: 32),
        const Text(
          'Упс! Что-то пошло не так',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        const Text(
          'Произошла какая-то ошибка.\nОбновите страницу чтобы продолжить.',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
