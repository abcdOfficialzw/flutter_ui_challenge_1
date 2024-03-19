import 'package:flutter/material.dart';
import 'package:week2/app/views/pages/card_page.dart';

import 'utils/theme/color_schemes.dart';
import 'utils/theme/type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        // textTheme: materialTextTheme()
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        //textTheme: materialTextTheme()
      ),
      themeMode: ThemeMode.system,
      home: const CardPage(),
    );
  }
}
