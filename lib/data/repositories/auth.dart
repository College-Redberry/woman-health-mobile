import 'package:result_dart/result_dart.dart';

import 'package:woman_health/domain/models/user.dart';
import 'package:woman_health/domain/repositories/auth.dart';
import 'package:woman_health/domain/services/hash.dart';

class HttpAuthRepository implements AuthRepository {
  final HashService _hashService;

  HttpAuthRepository(this._hashService);

  User? user;

  @override
  AsyncResult<User> signIn(String email, String password) async {
    final hashedPassword = _hashService.hashPassword(password);

    await Future.delayed(const Duration(seconds: 2));
    if (email == "tony@example.com" && hashedPassword == "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92") { // password=123456
      user = User(email: email);
      return Success(User(email: email));
    }
    
    return Failure(Exception("Unauthorized"));
  }
  
  @override
  bool isLogged() {
    return user != null;
  }
  
  @override
  void signOut() {
    user = null;
  }
  
  @override
  User? get loggedUser => user;
}