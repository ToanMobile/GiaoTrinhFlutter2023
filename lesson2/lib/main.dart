import 'package:flutter/material.dart';
import 'package:lesson2/author.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        dividerColor: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var demoString = "Hello world";
  var demoList = ["Android", "IOS", "React Native", "Xamarin", "Flutter"];
  var result = "";
  var resultList = "";
  var resultNew = [];

  var listUser = [Author(name: "Lesson1", id: 1), Author(name: "Lesson2")];
  void _countString() {
    setState(() {
      result = demoString.length.toString();
    });
  }

  void _indexString() {
    setState(() {
      var indexWFirst = demoString.indexOf("w"); //6
      var indexWTwo = demoString.indexOf("w", indexWFirst + 1);
      result = demoString.indexOf("w", indexWTwo + 1).toString();
    });
  }

  void _subString() {
    setState(() {
      result = demoString.substring(5, 8).toString();
    });
  }

  void _splitString() {
    setState(() {
      result = demoString.split("w").toString();
    });
  }

  void _countLength() {
    setState(() {
      resultList = demoList.length.toString();
    });
  }

  void _checkItem() {
    setState(() {
      resultList = demoList.contains("IOS").toString();
    });
  }

  void _getItem() {
    setState(() {
      resultList = demoList[2].toString();
    });
  }

  void _getItemTake() {
    setState(() {});
  }

  void _getItemFirst() {
    setState(() {});
  }

  void _getItemLast() {
    setState(() {});
  }

  void _addItem() {
    setState(() {
      var listNew = ["Lesson 9", "Lesson 9", "Lesson 9"];
      demoList.addAll(listNew);
      resultList = demoList.toString();
    });
  }

  void _removeItem() {
    setState(() {
      demoList.removeRange(0, 3);
      resultList = demoList.toString();
    });
  }

  void _mapItem() {
    setState(() {
      resultList = listUser.map((e) => e.id).toString();
    });
  }

  void _whereItem() {
    setState(() {
      resultList = demoList.indexWhere((element) => (element as String) == "IOS").toString();
      resultList = demoList.where((element) => (element as String).startsWith("IOM")).toString();
    });
  }

  void _mergeItem() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "StringResult:$result",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const CircularProgressIndicator(),
              const Divider(thickness: 4, color: Colors.blueGrey),
              ElevatedButton(onPressed: _countString, child: const Text("Count string")),
              ElevatedButton(onPressed: _indexString, child: const Text("Index string")),
              ElevatedButton(onPressed: _subString, child: const Text("Sub string")),
              ElevatedButton(onPressed: _splitString, child: const Text("Split string")),
              Text(
                "ListResult:$resultList",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(onPressed: _countLength, child: const Text("Count list")),
              ElevatedButton(onPressed: _countLength, child: const Text("Index list")),
              ElevatedButton(onPressed: _countLength, child: const Text("Sub list")),
              ElevatedButton(onPressed: _countLength, child: const Text("Split list")),
              ElevatedButton(onPressed: _getItem, child: const Text("Get list")),
              ElevatedButton(onPressed: _mapItem, child: const Text("Map list")),
              ElevatedButton(onPressed: _removeItem, child: const Text("Remove list"))
            ],
          ),
        ),
      ),
    );
  }
}
