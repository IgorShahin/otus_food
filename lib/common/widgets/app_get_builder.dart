import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'base_page/base_page_controller.dart';

typedef AppGetBuilderCreateController<T extends GetxController> = T? Function();

typedef ModalBottomCallback = void Function();

class AppGetBuilder<T extends BasePageController> extends StatefulWidget {
  final AppGetBuilderCreateController? controller;
  final GetControllerBuilder<T>? builder;
  final ModalBottomCallback? modalBottomWidget;
  final String? tag;

  const AppGetBuilder(
      {Key? key,
      this.controller,
      this.builder,
      this.tag,
      this.modalBottomWidget})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppGetBuilderState<T>();
}

// ===========================

class _AppGetBuilderState<T extends BasePageController>
    extends State<AppGetBuilder<T>> with GetStateUpdaterMixin {
  late T controller;

  VoidCallback? remove;

  @override
  void initState() {
    super.initState();

    if (T is BasePageController) throw "T is BasePageController";

    if (Get.isRegistered<T>(tag: widget.tag)) {
      debugPrint("deleting controller in ctor");
      Get.delete<T>(force: true, tag: widget.tag);
    }

    controller = widget.controller!() as T;
    Get.put<T>(controller, permanent: true, tag: widget.tag);

    controller.onStart();
    _subscribeToController();
  }

  /// Register to listen Controller's events.
  /// It gets a reference to the remove() callback, to delete the
  /// setState "link" from the Controller.
  void _subscribeToController() {
    remove?.call();
    remove = controller.addListener(getUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    if (Get.isRegistered<T>(tag: widget.tag)) {
      var registeredController = Get.find<T>(tag: widget.tag);
      if (controller == registeredController) {
        Get.delete<T>(force: true, tag: widget.tag);
      }
    }
    remove?.call();
  }

  @override
  Widget build(BuildContext context) => widget.builder!(controller);
}
