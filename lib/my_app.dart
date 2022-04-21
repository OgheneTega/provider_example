import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/id.dart';
import 'package:provider_example/widgets/input.dart';

import 'providers/cart.dart';
import 'providers/form.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FormProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _formProvider = Provider.of<FormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Input(
                    hintText: "e.g Chukwuma",
                    label: "First name",
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _formProvider.data['firstname'] = val;
                    },
                  ),
                  const SizedBox(height: 20),
                  Input(
                    hintText: "e.g Ciroma",
                    label: "Last name",
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _formProvider.data['lastname'] = val;
                    },
                  ),
                  const SizedBox(height: 20),
                  Input(
                    hintText: "e.g hello@gmail.com",
                    label: "Email",
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _formProvider.data['email'] = val;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                _formKey.currentState!.save();
                // Navigate to ID card page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const IDScreen(),
                  ),
                );
              },
              child: const Text("Validate and Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
