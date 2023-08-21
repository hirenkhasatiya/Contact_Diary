import 'package:contact_dairy/Utils/route_utils.dart';
import 'package:contact_dairy/views/screens/Detail_Page.dart';
import 'package:contact_dairy/views/screens/Home_Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        // textTheme: TextTheme(
        //   bodyMedium: TextStyle(
        //       fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
        // ),
      ),
      routes: {
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
      },
    );
  }
}
