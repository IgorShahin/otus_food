import 'package:otus_food/common/utils.dart';

import '../../common/res/app_assets.dart';

class RecipeInfo {
  final int id;
  final AppImageData image;
  final String title;
  final String time;

  const RecipeInfo(
      {required this.id,
      required this.image,
      required this.title,
      required this.time});

  @override
  String toString() {
    return 'RecipeInfo{id: $id, image: $image, title: $title, time: $time}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeInfo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          image == other.image &&
          title == other.title &&
          time == other.time;

  @override
  int get hashCode =>
      id.hashCode ^ image.hashCode ^ title.hashCode ^ time.hashCode;

  static final mocked = [
    RecipeInfo(
      id: 1,
      image: AppImages.recipe1_2x,
      title: l10n.teriyakiSalmonDish,
      time: l10n.fortyFiveMinutes,
    ),
    RecipeInfo(
      id: 2,
      image: AppImages.recipe2,
      title: l10n.tofuPokeBowl,
      time: l10n.thirtyMinutes,
    ),
    RecipeInfo(
      id: 3,
      image: AppImages.recipe3,
      title: l10n.georgianStyleBeefSteakWithCorn,
      time: l10n.oneHourFifteenMinutes,
    ),
    RecipeInfo(
      id: 4,
      image: AppImages.recipe4,
      title: l10n.blueberryBananaToast,
      time: l10n.fortyFiveMinutes,
    ),
    RecipeInfo(
      id: 5,
      image: AppImages.recipe5,
      title: l10n.seafoodPasta,
      time: l10n.twentyFiveMinutes,
    ),
    RecipeInfo(
      id: 6,
      image: AppImages.recipe6,
      title: l10n.doublePattyBurger,
      time: l10n.oneHour,
    ),
    RecipeInfo(
      id: 7,
      image: AppImages.recipe7,
      title: l10n.homemadeMargheritaPizza,
      time: l10n.twentyFiveMinutes,
    ),
  ];
}
