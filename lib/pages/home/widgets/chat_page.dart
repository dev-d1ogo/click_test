import 'package:click_teste2/controller/controller.dart';
import 'package:click_teste2/pages/chat/widgets/animations.dart';
import 'package:click_teste2/pages/home/widgets/chat_buble.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final List<MessageType> messageList;

  const ChatPage({super.key, required this.messageList});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _buildMessageList(widget.messageList)),
        Visibility(
          visible: controller.isLoading,
          child: const ThreeDots(),
        )
      ],
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // build message list

  Widget _buildMessageList(List<MessageType> messageList) {
    _scrollToBottom();

    return ListView.builder(
        itemCount: messageList.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return _buildMessageItem(messageList[index]);
        });
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
