import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter.dart';
import 'package:provider_example/flavor.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ValueNotifier<int>>(
        // lazy: false,
        create: (BuildContext context) => ValueNotifier<int>(0),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);
    final counter = Provider.of<ValueNotifier<int>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(flavor.toString()),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<ValueNotifier<int>>(
              builder: (_, counter, __) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
