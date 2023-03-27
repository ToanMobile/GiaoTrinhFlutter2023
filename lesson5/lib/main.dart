import 'dart:async';

import 'package:flutter/material.dart';

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
  var listDemo = [];
  var _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get api
    //parse
    Timer.periodic(Duration(seconds: 1), (timer) {
      _incrementCounter();
    });
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        listDemo = List.generate(100, (index) => "Lesson $index");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30, child: Text("count:$_counter", style: TextStyle(fontSize: 30))),
            listDemo.length == 0
                ? CircularProgressIndicator()
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 30,
                    child: ListView.custom(
                      childrenDelegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Text(
                            listDemo[index],
                            style: TextStyle(fontSize: 30),
                          );
                        },
                        childCount: listDemo.length,
                      ),
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
