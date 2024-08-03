// ignore_for_file: public_member_api_docs, sort_constructors_first

class BibleApiUserEntity {
  final String name;
  final String email;
  final String password;
  String? token;
  final bool notifications;

  BibleApiUserEntity({
    required this.name,
    required this.email,
    this.token,
    required this.password,
    this.notifications = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'notifications': notifications,
    };
  }
}
