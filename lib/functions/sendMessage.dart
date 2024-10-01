import 'package:click_teste2/types/message_type.dart';

Future<void> sendMessage(controller) async {
  // Cria a mensagem do usuário
  MessageType userMessage =
      MessageType(message: controller.text, type: MessageTypeEnum.message);

  controller.addItem(userMessage);

  final message = controller.text;

  controller.resetText();

  final data = await controller.callApi(message);

  MessageType botMessage =
      MessageType(message: data.response, type: MessageTypeEnum.response);

  controller.addItem(botMessage);
}
