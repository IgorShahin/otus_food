import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otus_food/core/constants/colors.dart';
import 'package:otus_food/core/extensions/context_extension.dart';
import 'package:otus_food/core/widgets/base_container.dart';
import 'package:otus_food/core/widgets/button/primary_button.dart';
import 'package:otus_food/features/recipes/domain/entities/recipe_entity.dart';
import 'package:otus_food/resources/assets.gen.dart';

class RecipeItemScreen extends StatefulWidget {
  const RecipeItemScreen({super.key, required this.recipe});

  final RecipeEntity recipe;

  @override
  State<RecipeItemScreen> createState() => _RecipeItemScreenState();
}

class _RecipeItemScreenState extends State<RecipeItemScreen> {
  @override
  Widget build(BuildContext context) => BaseContainer(
        appBar: AppBar(
          title: Text(context.l10n.titleAppBarItemRecipe),
        ),
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              Text(
                widget.recipe.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.watch_later_outlined, weight: 16),
                  const SizedBox(width: 11),
                  Text(
                    '${widget.recipe.duration} ${context.l10n.minutes}',
                    style: TextStyle(
                      color: context.colors.accentColor,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              widget.recipe.photoUrl == null
                  ? Container(
                      width: 149,
                      height: 136,
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        Assets.images.noImage.path,
                        fit: BoxFit.fill,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl: widget.recipe.photoUrl!,
                        width: double.infinity,
                        height: 360,
                        fit: BoxFit.fill,
                      ),
                    ),
              const SizedBox(height: 16),
              Text(
                context.l10n.ingredients,
                style: TextStyle(
                  color: context.colors.mainColor,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 6,
                  top: 15,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 3, color: AppColors.mutedGray),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: widget.recipe.ingredients
                      .map(
                        (e) => Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FlexColumnWidth(5),
                            2: FlexColumnWidth(1),
                            3: FlexColumnWidth(5),
                          },
                          children: [
                            TableRow(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•  ${e.name}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                                const SizedBox(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.count,
                                      style: const TextStyle(
                                        color: AppColors.mutedGray,
                                        fontSize: 13,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 19),
              Text(
                context.l10n.steps,
                style: TextStyle(
                  color: context.colors.mainColor,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => Container(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 22,
                    top: 33,
                    bottom: 23,
                  ),
                  width: double.infinity,
                  // height: 120,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEBEBEB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Color(0xFFC2C2C2),
                          fontSize: 40,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 29),
                      Expanded(
                        child: Text(
                          widget.recipe.steps[index].content,
                          softWrap: true,
                          maxLines: null,
                          style: const TextStyle(
                            color: AppColors.mutedGray,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 4,
                                  color: AppColors.mutedGray,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            '${widget.recipe.steps[index].duration}:00',
                            style: const TextStyle(
                              color: AppColors.mutedGray,
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  if (index < widget.recipe.steps.length - 1) {
                    return const SizedBox(height: 14);
                  }
                  return const SizedBox();
                },
                itemCount: widget.recipe.steps.length,
              ),
              const SizedBox(height: 27),
              Center(
                child: PrimaryButton(
                  title: context.l10n.startCooking,
                  color: context.colors.mainColor,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );
}
