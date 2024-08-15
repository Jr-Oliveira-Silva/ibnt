// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

class BibleBookEntity {
  Abbreviation abbrev;
  String author;
  int chapters;
  String group;
  String name;
  String testament;

  BibleBookEntity({
    required this.abbrev,
    required this.author,
    required this.chapters,
    required this.group,
    required this.name,
    required this.testament,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'abbrev': abbrev.toMap(),
      'author': author,
      'chapters': chapters,
      'group': group,
      'name': name,
      'testament': testament,
    };
  }

  factory BibleBookEntity.fromMap(Map<String, dynamic> map) {
    return BibleBookEntity(
      abbrev: Abbreviation.fromMap(map['abbrev'] as Map<String, dynamic>),
      author: map['author'] as String,
      chapters: map['chapters'] as int,
      group: map['group'] as String,
      name: map['name'] as String,
      testament: map['testament'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BibleBookEntity.fromJson(String source) => BibleBookEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
