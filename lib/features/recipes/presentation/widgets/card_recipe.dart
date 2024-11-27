import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otus_food/core/extensions/context_extension.dart';

import '../../../../resources/assets.gen.dart';

class CardRecipe extends StatelessWidget {
  const CardRecipe({
    super.key,
    required this.onTap,
    required this.image,
    required this.name,
    required this.time,
  });

  final VoidCallback onTap;
  final String? image;
  final String name;
  final int time;

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            color: Colors.transparent,
            child: Row(
              children: [
                image == null
                    ? Container(
                        width: 149,
                        height: 136,
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          Assets.images.noImage.path,
                          fit: BoxFit.fill,
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: image!,
                        width: 149,
                        height: 136,
                        imageBuilder: (context, imageProvider) => Ink.image(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
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
                            context.l10n.time(time),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: context.colors.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
