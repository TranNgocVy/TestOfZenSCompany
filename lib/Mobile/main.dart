import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testofzenscompany/Mobile/Component/Footer.dart';
import 'package:testofzenscompany/Mobile/Const/Const.dart';
import 'package:testofzenscompany/Mobile/Model/Joke.dart';
import 'package:testofzenscompany/Mobile/SerVice/DatabaseService.dart';
import 'package:testofzenscompany/Mobile/SerVice/HandleService.dart';
import './Component/Header.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userCookie = "1234568";
  Joke? joke;

  @override
  void initState() {

    insertJoke();
    changeJoke(userCookie);
  }

  void changeJoke(String userCookie) async {
    final newJoke = await HandleService.changeJoke(userCookie);
    setState(() {
      joke = newJoke;
    });
  }

  void insertJoke() async {
    Const.JOKESCONTENT.forEach((element) async  {
      int id = element.hashCode;
      await JokeService.insertJoke(Joke(id: id, content: element, createdAt: DateTime.now()));
      id++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              padding: EdgeInsets.all(30),
              color: Colors.green,
              child: Column(

                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "A joke a day keeps the doctor away",
                          style: TextStyle(
                            fontSize: Const.TITLESIZE,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,

                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "If you joke wrong way, your teeth have to pay. (Serious)",
                          style: TextStyle(
                            fontSize: Const.CONTENTSIZE,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,

                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 30, 20,30),
              child: Text(
                joke != null ? "${joke!.content}" : "Loading",
                style: TextStyle(
                  fontSize: Const.CONTENTSIZE,
                ),
              ),

            ),

            Container(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      if(joke != null && joke!.id != null){
                        HandleService.insertVotedToday(joke!.id, 1, userCookie);
                        changeJoke(userCookie);
                      }
                    },
                    child: Text("This is Funny!", style: TextStyle(color: Colors.white),),
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all(Colors.blueAccent),
                    ),
                  ),ElevatedButton(
                    onPressed: (){
                      if(joke != null && joke!.id != null){
                        HandleService.insertVotedToday(joke!.id, 0, userCookie);
                        changeJoke(userCookie);
                      }
                    },
                    child: Text("This is not Funny!", style: TextStyle(color: Colors.white),),
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all(Colors.green),
                    ),
                  )
                ],
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
