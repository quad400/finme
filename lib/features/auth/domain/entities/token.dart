class Token {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const Token({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });
}
