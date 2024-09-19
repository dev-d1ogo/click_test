enum MessageTypeEnum { response, message }

class MessageType {
  String message;
  MessageTypeEnum type;

  MessageType({required this.message, required this.type});

  MessageType.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        type = MessageTypeEnum.values.firstWhere(
          (e) => e.toString().split('.').last == json['type'],
          orElse: () =>
              MessageTypeEnum.message, // valor padrão caso não encontre
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['type'] = type.toString().split('.').last; // Converte enum para string
    return data;
  }
}
