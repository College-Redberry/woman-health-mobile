import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:woman_health/domain/services/hash.dart';

class CryptoHashService implements HashService {
  @override
  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);

    return digest.toString();
  }
}