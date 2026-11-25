class AccessClaims {
  final String sub;
  final String uniqueName;
  final String role;
  final String jti;
  final String customerId;
  final String avatar;
  final String hasPin;
  final String firstName;
  final String lastName;
  final String iss;
  final String aud;
  final int nbf;
  final int exp;

  AccessClaims({
    required this.sub,
    required this.uniqueName,
    required this.role,
    required this.jti,
    required this.customerId,
    required this.avatar,
    required this.hasPin,
    required this.firstName,
    required this.lastName,
    required this.iss,
    required this.aud,
    required this.nbf,
    required this.exp,
  });

  factory AccessClaims.fromJson(Map<String, dynamic> json) {
    return AccessClaims(
      sub: json['sub'],
      uniqueName: json['unique_name'],
      role: json['role'],
      jti: json['jti'],
      customerId: json['customerId'],
      avatar: json['avatar'],
      hasPin: json['hasPin'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      iss: json['iss'],
      aud: json['aud'],
      nbf: int.parse(json['nbf'].toString()),
      exp: int.parse(json['exp'].toString()),
    );
  }
}
