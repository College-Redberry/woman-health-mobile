import 'package:flutter/material.dart';

import 'package:woman_health/domain/models/cycle.dart';
import 'package:woman_health/domain/repositories/auth.dart';
import 'package:woman_health/domain/repositories/cycle.dart';

class ProfileViewModel extends ChangeNotifier {
  final CycleRepository _cicleRepository;
  final AuthRepository _authRepository;

  ProfileViewModel(this._cicleRepository, this._authRepository); 

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  MenstrualCycle? cycle;
  String? get email => _authRepository.loggedUser?.email;

  Future<void> loadCycle() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    final result = await _cicleRepository.getCicleByUserId("");

    result.fold(
      (success) => cycle = success,
      (error) => _error = error.toString(),
    );

    _isLoading = false;
    notifyListeners();
  }
}