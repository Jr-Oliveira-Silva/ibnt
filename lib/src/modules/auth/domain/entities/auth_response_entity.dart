import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class AuthResponseEntity extends BaseUserEntity {
  AuthResponseEntity({
    required super.id,
    required super.email,
    required super.role,
    this.token,
  });

  String? token;

  Map<String, dynamic> toMap() {
    return {
      "id": super.id,
      "email": super.email,
      "role": super.role?.name,
      "token": token,
    };
  }

  String toJson() => jsonEncode(toMap());
}
