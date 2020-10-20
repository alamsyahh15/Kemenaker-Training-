import 'package:flutter/material.dart';
import 'package:simple_chat/screen/simple_chat.dart';
import 'package:simple_chat/screen/simple_http.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Home"),
      ),
      
      body: Column(
        children: [
          
          /// Button SImple Request Http
          RaisedButton(
            color:Colors.green,
            textColor:Colors.white,
            child: Text("Simple request http"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => SimpleHttpPage()));
            },
          ),
          
          /// Button SImple Chat Page
          RaisedButton(
            color:Colors.green,
            textColor:Colors.white,
            child: Text("Simple Chat Page"),
            onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder:(context) => SimpleChatPage()));
            
            },
          ),
        ],
      ),

    );
  }
}