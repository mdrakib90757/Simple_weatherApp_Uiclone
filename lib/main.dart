import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_uiclone/Provider/theme_provider.dart';
import 'package:weatherapp_uiclone/Screen/get_strated_screen.dart';
import 'package:weatherapp_uiclone/Screen/home_screen.dart';
import 'package:weatherapp_uiclone/Widgets/custom_navigationbar.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentTheme,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0E1330),
        brightness: Brightness.dark,
      ),
      home: GetStratedScreen()
    );
  }
}


