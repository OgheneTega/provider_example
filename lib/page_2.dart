import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

class Page2Screen extends StatefulWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  State<Page2Screen> createState() => _Page2ScreenState();
}

class _Page2ScreenState extends State<Page2Screen> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: Center(child: Text("Current count is : ${counter.value}")),
    );
  }
}
