import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/flavor.dart';
import 'package:provider_example/my_app.dart';

void main() {
  runApp(
    Provider<Flavor>.value(
      value: Flavor.dev,
      child: const MyApp(),
    ),
  );
}
