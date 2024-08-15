class AuthRecoveryEntity {
  String fullName;
  String verificationCode;
  String verificationEmail;
  String newPassword;

  AuthRecoveryEntity({
    required this.fullName,
    required this.verificationCode,
    required this.verificationEmail,
    required this.newPassword,
  });
}