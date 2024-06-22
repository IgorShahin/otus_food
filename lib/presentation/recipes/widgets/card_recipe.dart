import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/context_extension.dart';
import 'package:otus_food/core/res/app_colors.dart';

class CardRecipe extends StatelessWidget {
  const CardRecipe({
    super.key,
    required this.onTap,
    required this.image,
    required this.name,
    required this.time,
  });

  final VoidCallback onTap;
  final String image;
  final String name;
  final int time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Ink(
        padding: const EdgeInsets.only(right: 23),
        width: 396,
        height: 136,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withAlpha(10),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ]),
        child: Row(
          children: [
            CachedNetworkImage(
                imageUrl: image, width: 149, height: 136, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.access_time_outlined, size: 21),
                      const SizedBox(width: 11),
                      Text(
                        "$time min",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: context.color.accentColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
