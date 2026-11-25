import 'package:finme/core/models/access_claims.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AccessTokenClaims {

  static AccessClaims? parse(String accessToken){
    try {
      final payload = Jwt.parseJwt(accessToken);
      return payload as AccessClaims;
    } catch (_) {
      return null;
    }
  }
}

