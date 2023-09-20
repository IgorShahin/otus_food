import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/intf/logger.dart';

class BasePageController extends GetxController implements DisposableInterface {
  var state = BasePageViewModelState.none.obs;
  var error = Rx<String?>(null);
  dynamic exception;
  var isEmpty = true.obs;
  var onCloseCalled = false;
  VoidCallback? retryCallback;
  String tag;
  late Logger logger;
  final _subscriptions = <StreamSubscription>[];

  BasePageController(
      {this.tag = "BasePageController", BasePageViewModelState? initialState}) {
    logger = Logger.create(tag);
    if (initialState != null) {
      state.value = initialState;
    }
  }

  @override
  void onClose() {
    debugPrint("BasePageController [${runtimeType.toString()}] - onClose");
    onCloseCalled = true;

    while (_subscriptions.isNotEmpty) {
      _subscriptions.first.cancel();
      _subscriptions.removeAt(0);
    }
    super.onClose();
  }

  void listen<T>(Rx<T> observable, void Function(T) onData) {
    _subscriptions.add(observable.listen(onData));
  }

  Future<void> setError(dynamic error, {VoidCallback? retryCallback}) async {
    if (onCloseCalled) {
      return;
    }
    exception = error;
    this.error.value = error.toString();
    this.retryCallback = retryCallback;
    state.value = BasePageViewModelState.errors;
    debugPrint(error.toString());
    // }
  }

  void close() {
    Get.back();
  }

  Future<void> withState(BasePageViewModelState state, Function action) async {
    var prevState = this.state.value;
    this.state.value = state;
    try {
      await action();
    } finally {
      this.state.value = prevState;
    }
  }
}

enum BasePageViewModelState {
  none,
  loading,
  loaded,
  refreshing,
  errors,
  saving
}
