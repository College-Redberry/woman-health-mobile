import 'package:flutter/material.dart';

import 'package:woman_health/domain/repositories/auth.dart';
import 'package:go_router/go_router.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  LoginViewModel(this._authRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signIn(BuildContext context, String email, String password) async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    final result = await _authRepository.signIn(email, password);

    result.fold(
      (success) => context.go("/home"),
      (failure) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to login: $failure")),
      ),
    );

    _isLoading = false;
    notifyListeners();
  }
}