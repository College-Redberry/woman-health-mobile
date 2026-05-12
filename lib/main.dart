import 'package:flutter/material.dart';

import 'package:woman_health/data/repositories/auth.dart';
import 'package:woman_health/data/services/auth.dart';
import 'package:woman_health/data/services/hash.dart';
import 'package:woman_health/router.dart';
import 'package:woman_health/ui/auth/view_models/login_scope.dart';
import 'package:woman_health/ui/auth/view_models/login.dart';
import 'package:woman_health/ui/core/theme/app_theme.dart';

void main() {
  final hashService = CryptoHashService();
  final authService = MockAuthService();

  final authRepository = HttpAuthRepository(authService, hashService);
  final loginViewModel = LoginViewModel(authRepository);

  runApp(
    LoginScope(
      viewModel: loginViewModel,
      child: MaterialApp.router(
        routerConfig: router,
        theme: AppTheme.light(),
      ),
    ),
  );
}