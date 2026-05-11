import 'package:result_dart/result_dart.dart';

import 'package:woman_health/domain/models/user.dart';
import 'package:woman_health/domain/repositories/auth.dart';
import 'package:woman_health/domain/services/auth.dart';
import 'package:woman_health/domain/services/hash.dart';

class HttpAuthRepository implements AuthRepository {
  final AuthService _authService;
  final HashService _hashService;

  HttpAuthRepository(this._authService, this._hashService);

  @override
  AsyncResult<User> signIn(String email, String password) async {
    final hashedPassword = _hashService.hashPassword(password);

    return await _authService.authenticate(email, hashedPassword);
  }
}