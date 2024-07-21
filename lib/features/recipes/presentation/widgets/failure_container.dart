import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otus_food/core/extensions/context_extension.dart';
import 'package:otus_food/resources/assets.gen.dart';

class FailureContainer extends StatelessWidget {
  const FailureContainer({super.key});

  @override
  Widget build(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.images.iconFailure.path,
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
