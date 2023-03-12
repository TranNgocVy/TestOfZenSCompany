import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Joke {
  final int id;
  final String content;
  final DateTime? createdAt;

  const Joke({
    required this.id,
    required this.content,
    this.createdAt
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'created_at': createdAt.toString()
    };
  }

  @override
  String toString() {
    return 'Joke{id: $id, content: $content, createdAt: $createdAt}';
  }
}
