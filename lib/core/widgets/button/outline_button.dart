import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/context_extension.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          maximumSize: const Size(232, 48),
          foregroundColor: context.colors.mainColor,
          backgroundColor: Colors.white,
          side: BorderSide(color: context.colors.mainColor, width: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: SizedBox(
          width: 232,
          height: 48,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: context.colors.mainColor,
              ),
            ),
          ),
        ),
      );
}
