import 'package:click_teste2/pages/home/home_page.dart';
import 'package:click_teste2/pages/home/widgets/chat_buble.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final List<MessageType> messageList;
  final Function(MessageType) onMessageAdded;

  const ChatPage(
      {super.key, required this.messageList, required this.onMessageAdded});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: _buildMessageList(widget.messageList))],
    );
  }

  // build message list

  Widget _buildMessageList(List<MessageType> messageList) {
    return ListView.builder(
      itemCount: messageList.length,
      itemBuilder: (context, index) {
        return _buildMessageItem(messageList[index]);
      },
    );
  }

  Widget _buildMessageItem(MessageType data) {
    var alignment = data.type == MessageTypeEnum.response
        ? Alignment.centerLeft
        : Alignment.centerRight;

    var crossAlignment = data.type == MessageTypeEnum.response
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.end;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: crossAlignment,
          children: [
            ChatBuble(
              message: data.message,
              type: data.type,
            ),
          ],
        ),
      ),
    );
  }
}
