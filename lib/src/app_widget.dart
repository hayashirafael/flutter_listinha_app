import 'package:flutter/material.dart';
import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/home/edit_task_board_page.dart';
import 'package:listinha/src/home/home_page.dart';
import 'package:listinha/src/shared/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        '/': (context) => const HomePage(),
        '/edit': (context) => const EditTaskBoardPage(),
        '/config': (context) => const ConfigurationPage(),
      },
    );
  }
}
