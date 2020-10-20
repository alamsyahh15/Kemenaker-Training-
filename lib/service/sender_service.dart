import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pusher/pusher.dart';
import 'package:simple_chat/model/chat_model.dart';
import 'package:simple_chat/screen/simple_chat.dart';
import 'package:simple_chat/service/receive_service.dart';

class SenderService extends ChangeNotifier{
  BuildContext context;
  SenderService(this.context);


  /// Declare connect to pusher
  Pusher pusher = Pusher('1091490','35f47a7ce7d82733526a','9dfd3dc9e447b7fe2605', PusherOptions(cluster:'ap1'));


  //Fungsi Send Event 
  Future sendEvent(ChatModel data, ReceiveService receive)async{
    receive.listChat.add(getSenderView(context, data.content,data.senderName));
    notifyListeners();
    try{
      var res = await pusher.trigger(['grup_sciencecom'],'trainingFlutter', data.toJson());
      print(res.message);
    }catch(e){
      print("Exception $e");
    }
  }


}