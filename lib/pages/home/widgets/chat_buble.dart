import 'package:click_teste2/pages/home/controller.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  final String message;
  final MessageTypeEnum type;
  const ChatBuble({super.key, required this.message, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: type == MessageTypeEnum.response
            ? Theme.of(context).primaryColor
            : Colors.green,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              type == MessageTypeEnum.response ? message : "$message ?",
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 48,
                  width: 48, // Define a largura do botão
                  child: AudioButton(
                    message: message,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AudioButton extends StatelessWidget {
  final String message;

  const AudioButton({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white, // Cor de fundo do botão
        shape: BoxShape.circle, // Forma arredondada
      ), // Cor de fundo do botão
      child: IconButton(
        onPressed: () async {
          await controller.speak(message);
        },
        icon: const Icon(Icons.graphic_eq, color: Colors.blue), // Cor do ícone
        iconSize: 20,
        padding: EdgeInsets.zero,
        // Use o padding se precisar de ajuste fino
      ),
    );
  }
}
