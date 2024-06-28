import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otus_food/core/extensions/context_extension.dart';
import 'package:otus_food/core/res/app_assets.dart';
import 'package:otus_food/core/res/resources.dart';

class FailureContainer extends StatelessWidget {
  const FailureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.iconFailure,
          width: 196,
          height: 188,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 32),
        Text(
          context.l10n.errorTitleMessage,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        Text(
          context.l10n.errorDescriptionMessage,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
