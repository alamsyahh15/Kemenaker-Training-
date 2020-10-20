// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
    ChatModel({
        this.idSender,
        this.senderName,
        this.content,
    });

    int idSender;
    String senderName;
    String content;

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        idSender: json["id_sender"] == null ? null : json["id_sender"],
        senderName: json["sender_name"] == null ? null : json["sender_name"],
        content: json["content"] == null ? null : json["content"],
    );

    Map<String, dynamic> toJson() => {
        "id_sender": idSender == null ? null : idSender,
        "sender_name": senderName == null ? null : senderName,
        "content": content == null ? null : content,
    };
}
