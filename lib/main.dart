import 'dart:math';

import 'package:flutter/material.dart';

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
      home: ListWidget(),
    );
  }
}

class ListWidget extends StatelessWidget {
  ListWidget({super.key});
  final List<Widget> items = List.generate(1000, (index) {
    final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return ListTile(
      tileColor: color,
      title: Text(
        'Item ${index + 1}',
        textAlign: TextAlign.center,
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Demo"),
      ),
      body: ListView(
        children: items,
      ),
    );
  }
}
