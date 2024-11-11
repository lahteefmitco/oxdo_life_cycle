import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oxdo_life_cycle/second_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

 

  @override
  void didChangeDependencies() {
    // Code to respond to dependency changes
    super.didChangeDependencies();
    log("Called didChangeDependencies in home screen");
    
  }

  @override
  void deactivate() {
    log("Deactivation called in home screen");
    super.deactivate();
  }

  @override
  void dispose() {
    log("Called dispose in home screen");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // didChangeDependencies will call when fetch widget
    final width = MediaQuery.of(context).size.width;
    log("Width:- $width");


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            CustmeCounterText(counter: _counter),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondScreen()));
                },
                child: const Text("Second screen"))
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

class CustmeCounterText extends StatefulWidget {
  final int counter;
  const CustmeCounterText({super.key, required this.counter});

  @override
  State<CustmeCounterText> createState() => _CustmeCounterTextState();
}

class _CustmeCounterTextState extends State<CustmeCounterText> {
  @override
  void didUpdateWidget(covariant CustmeCounterText oldWidget) {
    log("Called didUpdateWidget in CustomCounterText");
    final oldValue = oldWidget.counter;
    log("Called didUpdateWidget in CustomCounterText $oldValue");

    final newValue = widget.counter;
    log("Called didUpdateWidget in CustomCounterText $newValue");

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.counter}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
