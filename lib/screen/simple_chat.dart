import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:provider/provider.dart';
import 'package:simple_chat/model/chat_model.dart';
import 'package:simple_chat/service/receive_service.dart';
import 'package:simple_chat/service/sender_service.dart';

class SimpleChatPage extends StatefulWidget {
  @override
  _SimpleChatPageState createState() => _SimpleChatPageState();
}

class _SimpleChatPageState extends State<SimpleChatPage> {
  TextEditingController _textController = TextEditingController();
  ChatModel chatModel = ChatModel(idSender: 1, senderName: "Alamsyah");

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReceiveService(context)),
        ChangeNotifierProvider(create: (context) => SenderService(context)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("T-Chat"),
          centerTitle: true,
        ),
        body: Consumer<ReceiveService>(
          builder: (context, receive, _) => Consumer<SenderService>(
            builder: (context, sender, _) => Column(
              children: [
                Expanded(
                  child: receive.listChat.length == 0
                      ? Center(child: Text("Tidak Ada Chat"))
                      : ListView(
                          children: receive.listChat.map((e) => e).toList(),
                        ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 10,
                          controller: _textController,
                          onChanged: (val) {
                            setState(() {
                              chatModel.content = val;
                            });
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              hintText: " Type in here .."),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () async {
                          await sender.sendEvent(chatModel, receive);
                          _textController.clear();
                          FocusScope.of(context).unfocus();
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

getSenderView(BuildContext context, content, senderName) => ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: Colors.blue,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Container(
                    color: Colors.black45,
                    width: 35,
                    height: 35,
                  ),
                ),
                SizedBox(width: 16),
                Text(senderName),
              ],
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(right: 8),
              child: Text(
                content,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );

getReceiverView(BuildContext context, content, senderName) => ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Container(
                    color: Colors.black45,
                    width: 35,
                    height: 35,
                  ),
                ),
                SizedBox(width: 16),
                Text(senderName),
              ],
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                content,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
