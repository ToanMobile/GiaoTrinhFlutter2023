import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lesson10/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db/database.dart';
import 'db/person.dart';
import 'storage/FlutterStorageDemo.dart';
import 'storage/counter_storage.dart';

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
      home: MyHomePage(title: "test",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _counter = 0;
  var userInfoObject;
  AppDatabase? database;

  @override
  void initState() async {
    await initDB();
    insertPersonDB();
    super.initState();
  }

  Future<void> initDB() async {
    database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  void _incrementCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 10);
    _counter = prefs.getInt("counter");
    //parse object
    var userInfo = UserInfo(name: "Lesson10", age: 2);
    await prefs.setString('userInfo', jsonEncode(userInfo));
    var getUser = prefs.getString("userInfo");
    var json = jsonDecode(getUser.toString());
    setState(() {
      userInfoObject = UserInfo.fromJson(json).toString();
    });
  }

  void insertPersonDB() async {
    final personDao = database?.personDao;
    final person = Person(1, 'Lesson9');
    final person2 = Person(2, 'Lesson10');
    await personDao?.insertPerson(person);
    await personDao?.insertPerson(person2);

    await personDao?.deletePerson(person2);
  }

  void getPersonDB() async {
    final personDao = database?.personDao;
    var result = await personDao?.findPersonById(2);
    result?.forEach((element) {
      print("getPersonDB=="+element.toString());
      setState(() {
        userInfoObject = element.toString();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$userInfoObject',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 60),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getPersonDB,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
