import 'package:flutter/material.dart';

import 'package:woman_health/ui/profile/view_models/profile.dart';


class ProfileScope extends InheritedNotifier<ProfileViewModel> {
  const ProfileScope({
    super.key,
    required ProfileViewModel viewModel,
    required super.child,
  }) : super(notifier: viewModel);

  static ProfileViewModel of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ProfileScope>();
    assert(scope != null, 'No ProfileViewModel found in context');
    return scope!.notifier!;
  }
}