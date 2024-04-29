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
      home: const ListWidget(),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  List<Widget> items = [];

  void generateItems() {
    Stopwatch stopwatch = Stopwatch()..start();
    List<Widget> newItems = List.generate(1000, (index) {
      final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      return ListTile(
        tileColor: color,
        title: Text(
          'Item ${index + 1}',
          textAlign: TextAlign.center,
        ),
      );
    });
    stopwatch.stop();
    debugPrint('List generated in ${stopwatch.elapsedMilliseconds} ms');

    setState(() {
      items = newItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: generateItems,
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text("List Demo"),
      ),
      body: ListView(
        children: items,
      ),
    );
  }
}
