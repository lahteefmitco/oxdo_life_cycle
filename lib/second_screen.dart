import 'dart:developer';

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void deactivate() {
    log("Called deactivation in second screen");
    super.deactivate();
  }

  @override
  void dispose() {
    log("Called dispose in second screen");
    super.dispose();
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
    );
  }
}
