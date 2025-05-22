// lib/core/constants/global.dart
import 'package:jwt_decoder/jwt_decoder.dart';

String? globalToken;
String? globalEmail;

bool get isLoggedIn {
  if (globalToken == null || globalToken!.isEmpty) return false;
  return !JwtDecoder.isExpired(globalToken!);
}