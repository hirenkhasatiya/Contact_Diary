import 'package:counter/controller/Counter_controller.dart';
import 'package:counter/controller/stepper_controller.dart';
import 'package:counter/views/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => counterController(preferences: preferences)),
        ChangeNotifierProvider(
            create: (context) => themeController(preferences: preferences)),
        ChangeNotifierProvider(create: (context) => stepperController()),
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
          ? ThemeMode.dark
          : ThemeMode.light,
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
