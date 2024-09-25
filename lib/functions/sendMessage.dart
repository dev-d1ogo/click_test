import 'package:click_teste2/pages/home/controller.dart';
import 'package:click_teste2/types/message_type.dart';

Future<void> sendMessage(HomeController controller) async {
  // Cria a mensagem do usuário
  MessageType userMessage =
      MessageType(message: controller.text, type: MessageTypeEnum.message);

  // Adiciona a mensagem do usuário
  controller.addItem(userMessage);

  // Captura a mensagem e limpa os controladores
  final message = controller.text;

  print(message);
  controller.resetText();
  // inputController.clear();

  // Chama a API e aguarda a resposta
  final data = await controller.callApi(message);
  print("A data chegou aqui ${data.response}");

  // Cria e adiciona a mensagem do bot

  MessageType botMessage =
      MessageType(message: data.response, type: MessageTypeEnum.response);

  controller.addItem(botMessage);
}
