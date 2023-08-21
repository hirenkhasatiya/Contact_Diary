import 'package:counter/controller/Counter_controller.dart';
import 'package:counter/views/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/themeController.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => counterController()),
        ChangeNotifierProvider(create: (context) => themeController())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: Provider.of<themeController>(context).getTheme
          ? ThemeMode.light
          : ThemeMode.system,
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
