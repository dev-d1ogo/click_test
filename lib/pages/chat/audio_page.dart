import 'package:click_teste2/pages/chat/widgets/audio_control.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});
  static const routeName = '/audio';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(
          "TIL",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 287,
                  width: 287,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Pressione para começar a falar",
                  style: TextStyle(),
                )
              ],
            ),
          ),
          AudioControl()
        ],
      ),
    );
  }
}
