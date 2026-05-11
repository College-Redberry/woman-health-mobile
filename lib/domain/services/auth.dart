import 'package:result_dart/result_dart.dart';

import 'package:woman_health/domain/models/user.dart';

abstract interface class AuthService {
  AsyncResult<User> authenticate(String email, String hash);
}