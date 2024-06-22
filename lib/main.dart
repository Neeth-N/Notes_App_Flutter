import 'package:flutter/material.dart';
import 'package:notes_app/Provider/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>NoteProvider(),
      child: MaterialApp(
        title: "NOTES APP",
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: HomeScreen(),
      ),
    );

  }
}