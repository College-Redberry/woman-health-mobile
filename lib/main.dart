import 'package:flutter/material.dart';

import 'package:woman_health/data/repositories/auth.dart';
import 'package:woman_health/data/repositories/cycle.dart';
import 'package:woman_health/data/services/hash.dart';
import 'package:woman_health/router.dart';
import 'package:woman_health/ui/auth/view_models/login_scope.dart';
import 'package:woman_health/ui/auth/view_models/login.dart';
import 'package:woman_health/ui/core/theme/app_theme.dart';
import 'package:woman_health/ui/profile/view_models/profile.dart';
import 'package:woman_health/ui/profile/view_models/profile_scope.dart';

void main() {
  final hashService = CryptoHashService();

  final authRepository = HttpAuthRepository(hashService);
  final cycleRepository = HttpCycleRepository();

  final loginViewModel = LoginViewModel(authRepository);
  final profileViewModel = ProfileViewModel(cycleRepository, authRepository);

  runApp(
    ProfileScope(
      viewModel: profileViewModel,
      child: LoginScope(
        viewModel: loginViewModel,
        child: MaterialApp.router(
          routerConfig: router,
          theme: AppTheme.light(),
        ),
      ),
    )
  );
}