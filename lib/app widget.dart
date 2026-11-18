import 'package:flutter/material.dart';

import 'app home.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operaciones',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 71, 232, 238))),
      home: const AppHome(),
    );
  }
}
