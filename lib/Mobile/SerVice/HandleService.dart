import 'dart:async';
import 'dart:math';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:testofzenscompany/Mobile/Const/Const.dart';
import 'package:testofzenscompany/Mobile/Model/Joke.dart';
import 'package:testofzenscompany/Mobile/Model/Voted.dart';
import 'package:testofzenscompany/Mobile/SerVice/DatabaseService.dart';


class HandleService {
  static Future<Joke> changeJoke(String userCookie) async {
    List<Joke> jokeList = await JokeService.getNotVotedJoke(userCookie);


    if (jokeList.isEmpty) {
      return Joke(id: -1, content: Const.OUTOFJOKECONTENT);
    }
    int selectedIndex = Random().nextInt(jokeList.length);

    return jokeList[selectedIndex];
  }

  static Future<void> insertVotedToday(int jokeId, int voted, String userCookie) async {
    DateTime now = DateTime.now();
    String str = "${jokeId} - $voted - $userCookie - ${now.microsecondsSinceEpoch}";
    Voted vote = Voted(id: str.hashCode, jokeId: jokeId, voted: voted, userCookie: userCookie, votedDay: now);

    await JokeService.insertVoted(vote);

  }
}