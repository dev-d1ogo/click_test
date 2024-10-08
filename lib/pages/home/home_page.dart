import 'package:click_teste2/controller/controller.dart';
import 'package:click_teste2/pages/home/widgets/chat_page.dart';
import 'package:flutter/material.dart';

import 'widgets/chart_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Controller();

  String getDisplayText() {
    switch (controller.status) {
      case "done":
      case "initial":
        return controller.enableToSpeech
            ? "Toque no microfone para falar"
            : "Fala indisponível, toque no microfone para ativar";
      default:
        return controller.isListening
            ? "...Ouvindo"
            : "Fala indisponível, toque no microfone para ativar";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TIL",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    controller.isListening
                        ? "...Ouvindo"
                        : controller.enableToSpeech ||
                                controller.status == "done" ||
                                controller.status == "initial"
                            ? "Toque no microfone para falar"
                            : "Fala indisponível toque no microfone para ativar",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 30,
                    width: 150,
                    padding: const EdgeInsets.all(16),
                    child: Text(controller.text),
                  ),
                  Expanded(
                    child: ChatPage(
                      messageList: controller.messageList,
                      onMessageAdded: controller.addItem,
                    ),
                  ),
                  ChatBar(
                    controller: controller,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
