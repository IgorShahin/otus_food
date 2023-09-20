import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otus_food/app/app_route.dart';
import 'package:otus_food/app/model/enum/login_status.dart';
import 'package:otus_food/app/service/impl/navigation_service_impl.dart';
import 'package:otus_food/common/widgets/base_page/base_page_controller.dart';

class RegisterPageController extends BasePageController {
  RegisterPageController() : super(tag: "RegisterPageController");

  final registerFlag = false.obs;

  Future<void> onLoginPressed(BuildContext context, LoginStatus loginStatus) async {
    context.navigation.navigateToRoute(AppRoute.home, arguments: loginStatus);
  }
}
