
import 'package:flutter/material.dart';

import 'lyrics_page.dart';

class LyricsPage extends StatelessWidget {
  const LyricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      final snackBar = SnackBar(
        content: const Text('Fiquarana hoke hum jeeye!!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Fiquarana hoke hum jeeye");
    }

    var list = [getBlueLyrics(), getFiquaranaLyrics()];
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: const Text(
              "Sing along",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                letterSpacing: 2,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            list.elementAt(0),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              letterSpacing: 2,
              fontSize: 20,
            ),
          ),
          Text(
            list.elementAt(1),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              letterSpacing: 2,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
