import 'package:flutter/material.dart';

import 'package:woman_health/domain/repositories/auth.dart';
import 'package:woman_health/domain/models/user.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  LoginViewModel(this._authRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  User? _user;
  User? get user => _user;

  Future<void> login(String email, String password) async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _authRepository.signIn(email, password);

    result.fold(
      (success) => _user = success,
      (failure) => _error = failure.toString(),
    );

    _isLoading = false;
    notifyListeners();
  }
}