import 'package:flutter/material.dart';

import 'login.dart';

class LoginScope extends InheritedNotifier<LoginViewModel> {
  const LoginScope({
    super.key,
    required LoginViewModel viewModel,
    required super.child,
  }) : super(notifier: viewModel);

  static LoginViewModel of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LoginScope>();
    assert(scope != null, 'No LoginScope found in context');
    return scope!.notifier!;
  }
}