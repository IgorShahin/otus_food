import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otus_food/app/model/enum/login_status.dart';
import 'package:otus_food/app/pages/register/register_page_controller.dart';
import 'package:otus_food/app/widgets/button/app_button.dart';
import 'package:otus_food/app/widgets/text_field/app_text_field.dart';
import 'package:otus_food/common/extensions.dart';
import 'package:otus_food/common/res/app_assets.dart';
import 'package:otus_food/common/res/app_colors.dart';
import 'package:otus_food/common/widgets/app_get_builder.dart';
import 'package:otus_food/common/widgets/app_image.dart';
import 'package:otus_food/common/widgets/scaffold/app_scaffold.dart';

import '../../widgets/bottom_navigation_bar/app_bottom_navigation_bar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGetBuilder<RegisterPageController>(
      controller: () => RegisterPageController(),
      builder: (controller) => AppScaffold(
        bottomNavigationBar: const AppBottomNavigationBar(selectedIndex: 1),
        body: Container(
          color: AppColors.green,
          // padding: const EdgeInsets.only(top: 213),
          child: Center(
            child: Obx(
              () => ListView(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 213),
                    child: _buildLogin(context, controller),
                  ),
                  _buildRegisterTextButton(context, controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildLogin(BuildContext context, RegisterPageController controller) {
    return Column(
      children: [
        Text(
          context.l10n.otusFood,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0.77,
          ),
        ),
        const SizedBox(height: 81),
        AppTextField(
          prefixIcon: const AppImage(AppImages.iconUser),
          hintText: context.l10n.textLogin,
          margin: const EdgeInsets.only(left: 98, right: 98),
          borderRadius: BorderRadius.circular(10),
        ),
        const SizedBox(height: 16),
        AppTextField(
          prefixIcon: const AppImage(AppImages.iconPassword),
          hintText: context.l10n.password,
          margin: const EdgeInsets.only(left: 98, right: 98),
          borderRadius: BorderRadius.circular(10),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        if (controller.registerFlag.value)
          AppTextField(
            prefixIcon: const AppImage(AppImages.iconPassword),
            hintText: context.l10n.passwordReload,
            margin: const EdgeInsets.only(left: 98, right: 98),
            borderRadius: BorderRadius.circular(10),
            obscureText: true,
          ),
        const SizedBox(height: 40),
        AppButton(
          title: context.l10n.buttonLogin,
          onPressed: () => controller.onLoginPressed(context, LoginStatus.entered),
        ),
      ],
    );
  }

  Widget _buildRegisterTextButton(
      BuildContext context, RegisterPageController controller) {
    return TextButton(
      onPressed: () {
        controller.registerFlag.value = !controller.registerFlag.value;
      },
      child: Text(
        controller.registerFlag.value
            ? context.l10n.loginApplication
            : context.l10n.register,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
