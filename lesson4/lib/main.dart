import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'componentDemo.dart';

void main() {
  runApp(const MyApp());
}

class StateLessWiget extends StatelessWidget {
  const StateLessWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlexDemo(),
    );
  }
}

class DemoWidget extends StatefulWidget {
  const DemoWidget({Key? key}) : super(key: key);

  @override
  State<DemoWidget> createState() => _DemoWidgetContainerState();
}

class FlexDemo extends StatelessWidget {
  const FlexDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            buildComponentFlexible(),
            const ComponentDemo(),
          ],
        ),
      ),
    );
  }

  Widget buildComponentFlexible() => SizedBox(
        width: double.infinity,
        height: 500,
        child: Column(
          children: [
            Flexible(flex: 5, child: Container(color: Colors.green)),
            Flexible(flex: 1, child: Container(color: Colors.red)),
            Expanded(child: Container(color: Colors.blue)),
            Image(
              width: 50,
              height: 50,
              image: CachedNetworkImageProvider(
                'assets/icon/logo.png',
              ),
            ),
            const Spacer(),
          ],
        ),
      );
}

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  void functionTest() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              width: double.infinity,
              height: 100,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  enabled: true,
                  labelText: "SDT",
                  hintText: "Bạn hãy nhập SDT",
                ),
              ),
            ),
            MaterialButton(onPressed: functionTest, child: Text("MaterialButton")),
            ElevatedButton(
              onPressed: functionTest,
              child: Text("ElevatedButton"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),
            TextButton(
              onPressed: functionTest,
              child: Text("TextButton"),
              style: TextButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),
            OutlinedButton(
              onPressed: functionTest,
              child: Text(
                "OutlinedButton",
                style: TextStyle(color: Colors.yellow),
              ),
              style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20)),
            ),
            FloatingActionButton(onPressed: functionTest),
            IconButton(onPressed: functionTest, icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black26,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.black26,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoWidgetContainerState extends State<DemoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lesson4")),
      body: Container(
        color: Colors.red,
        width: 500,
        height: 500,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.black, width: 5),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "Demo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
