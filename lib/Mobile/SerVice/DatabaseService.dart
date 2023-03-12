import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:testofzenscompany/Mobile/Const/Const.dart';
import 'package:testofzenscompany/Mobile/Model/Joke.dart';
import 'package:testofzenscompany/Mobile/Model/Voted.dart';


class JokeService {
  static Future<void> insertJoke(Joke joke) async {
    final db = await openOrCreateDataBase();
    await db.insert(
      'joke',
      joke.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Lấy các câu joke chưa được vote của 1 user trong ngày hôm nay
  static Future<List<Joke>> getNotVotedJoke(String userCookie) async {
    // final db = await JokeService.openOrCreateDataBase();

    List<Voted> votedList = await getVotedInToDay(userCookie);

    List<int> votedJokeIdList = [];
    votedList.forEach((element) {
      votedJokeIdList.add(element.jokeId!);
    });

    List<Joke> allJokes = await getAllJokes();
    List<Joke> notVotedJokes = [];

    allJokes.forEach((element) {
      if(!votedJokeIdList.contains(element.id)){
        notVotedJokes.add(element);
      }
    });

    return notVotedJokes;
  }

  //Lấy tất cả các Joke
  static Future<List<Joke>> getAllJokes() async {
    final db = await JokeService.openOrCreateDataBase();

    final List<Map<String, dynamic>> maps = await db.query('joke');

    return List.generate(maps.length, (i) {
      return Joke(
          id: maps[i]['id'],
          content: maps[i]['content'],
          createdAt: DateTime.parse(maps[i]['created_at'])
      );
    });
  }

  static Future<List<Voted>> getVotedInToDay(String userCookie) async {
    final db = await JokeService.openOrCreateDataBase();
    DateTime now = DateTime.now();
    // Lấy thông tin ngày
    String today = now.toString().split(" ")[0];

    final List<Map<String, dynamic>> maps = await db.query(
      'voted', where: 'user_cookie LIKE ? AND voted_day LIKE ?',
      whereArgs: [userCookie, today + '%'],
    );

    return List.generate(maps.length, (i) {
      return Voted(
        id: maps[i]['id'],
        jokeId: maps[i]['joke_id'],
        voted: maps[i]['voted'],
        userCookie: maps[i]['user_cookie'],
        votedDay: DateTime.parse(maps[i]['voted_day'])
      );
    });
  }
  static Future<void> insertVoted(Voted vote) async {
    final db = await openOrCreateDataBase();

    await db.insert(
      'voted',
      vote.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  static Future<Database> openOrCreateDataBase() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'jokecontent.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE joke(id INTEGER PRIMARY KEY, content TEXT, created_at TEXT)',
        );
        db.execute(
          'CREATE TABLE voted(id INTEGER PRIMARY KEY, joke_id INTEGER, voted INTEGER, user_cookie TEXT, voted_day TEXT)',
        );
      },
      version: 1,
    );
  }

}