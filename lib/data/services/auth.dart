import 'package:result_dart/result_dart.dart';

import 'package:woman_health/domain/models/user.dart';
import 'package:woman_health/domain/services/auth.dart';

class MockAuthService implements AuthService {
  @override
  AsyncResult<User> authenticate(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email == "tony@example.com" && password == "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92") { // password=123456
      return Success(User(email: email));
    }
    
    return Failure(Exception("Unauthorized"));
  }
}