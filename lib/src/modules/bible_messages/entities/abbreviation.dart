// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Abbreviation {
  String pt;
  String en;

  Abbreviation({
    required this.pt,
    required this.en,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pt': pt,
      'en': en,
    };
  }

  factory Abbreviation.fromMap(Map<String, dynamic> map) {
    return Abbreviation(
      pt: map['pt'] as String,
      en: map['en'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Abbreviation.fromJson(String source) => Abbreviation.fromMap(json.decode(source) as Map<String, dynamic>);
}
