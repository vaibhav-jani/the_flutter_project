import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      body: getSongBody(),
    );
  }

  Widget getSongBody() {
    return Text(
      getSongLyrics(),
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          letterSpacing: 2,
          fontSize: 20),
    );
  }

  String getSongLyrics() {
    return "\n bluee … "
        "\n\n blue … bekhauf nigahein "
        "\n blue … bebaak adayein "
        "\n blue … shaffaaf dilon mein "
        "\n blue … bedaagh wafaein "
        "\n blue … sagar ke dil mein "
        "\n blue … jitne khazane "
        "\n blue … dil ke sagar mein "
        "\n blue … utne fasane "
        "\n aatish aangare "
        "\n sholon ke dhaaare "
        "\n rangeen sharaare "
        "\n barish ke dhaare "
        "\n sad rang wafa ka "
        "\n sagar mein kyon hai "
        "\n khabhi surkh lahu hai "
        "\n kabhi rang blue hai "
        "\n\n hoii hoiii hoiii … ";
  }

  Widget title() {
    return const Text(
      "DEEP BLUE",
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          letterSpacing: 2,
          fontSize: 20),
    );
  }

  ThemeData getTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }
}
