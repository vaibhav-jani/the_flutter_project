
import 'package:flutter/material.dart';
import 'package:the_flutter_project/songs.dart';
import 'package:the_flutter_project/theme.dart';

class TheSongsApp extends StatelessWidget {
  const TheSongsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: getHome(),
    );
  }

  Scaffold getHome() {
    return Scaffold(
      backgroundColor: (Colors.blue),
      appBar: AppBar(
        title: title(),
      ),
      body: const LyricsPage(),
    );
  }
}


Widget title() {
  return const Text(
    "DEEP BLUE",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      letterSpacing: 2,
      fontSize: 20,
    ),
  );
}
