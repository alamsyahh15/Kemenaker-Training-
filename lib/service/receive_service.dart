import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pusher_websocket_flutter/pusher.dart';
import 'package:simple_chat/model/chat_model.dart';
import 'package:simple_chat/screen/simple_chat.dart';

class ReceiveService extends ChangeNotifier{
  BuildContext context;
  List<Widget> listChat = [];
  Channel channel;

  ReceiveService(this.context){
    this.initPusher();
  }

  Future initPusher()async{
    try{
      await Pusher.init("35f47a7ce7d82733526a", PusherOptions(cluster: "ap1"));
    }catch(_){
      print("Excetion $_");
    }

    // Connect to server pusher
    await Pusher.connect(onConnectionStateChange: (val){
      print("Connection ${val.currentState}");
    }, onError: (err){
      print("Error $err");
    });

    /// Subscribe channel to connect grup
    channel = await Pusher.subscribe("grup_sciencecom");

    // Bind data from channel
    channel.bind("trainingFlutter", (onEvent){
      ChatModel data = ChatModel.fromJson(jsonDecode(onEvent.data));
      listChat.add(getReceiverView(context, data.content, data.senderName));
      notifyListeners();
    });

  }
}