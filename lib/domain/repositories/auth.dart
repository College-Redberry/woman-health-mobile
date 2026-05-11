import 'package:result_dart/result_dart.dart';

import '../models/user.dart';

abstract interface class AuthRepository {
  AsyncResult<User> signIn(String email, String password);
}