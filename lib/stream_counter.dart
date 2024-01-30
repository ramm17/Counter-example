import 'dart:async';

import 'package:flutter/material.dart';

class StreamCounter extends StatefulWidget {
  const StreamCounter({super.key});

  @override
  State<StreamCounter> createState() => _StreamCounterState();
}

class _StreamCounterState extends State<StreamCounter> {
  int count = 0;
  final StreamController<int> _streamController = StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _streamController.stream.listen((event) {
      print(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count ++;
          _streamController.sink.add(count);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _streamController.stream,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              "${snapshot.data}",
              style: Theme.of(context).textTheme.headlineLarge,
            );
          }
        ),
      ),
    );
  }
}
