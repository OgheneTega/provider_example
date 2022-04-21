import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/form.dart';

class IDScreen extends StatelessWidget {
  const IDScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("ID Screen")),
      body: Column(
        children: [
          Text("${provider.data['firstname']}"),
          Text("${provider.data['lastname']}"),
          Text("${provider.data['email']}"),
        ],
      ),
      // body: Consumer<FormProvider>(
      //   builder: (ctx, provider, child) => Column(
      //     children: [
      //       Text("${provider.data['firstname']}"),
      //       Text("${provider.data['lastname']}"),
      //       Text("${provider.data['email']}"),
      //     ],
      //   ),
      // ),
    );
  }
}
