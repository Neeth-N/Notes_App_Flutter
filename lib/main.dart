import 'package:flutter/material.dart';
import 'package:notes_app/Provider/note_provider.dart';
import 'package:notes_app/Provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/Screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NoteProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NOTES APP",
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomeScreen(),
    );

  }
}