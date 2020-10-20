import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_chat/model/user_model.dart';

class SimpleHttpPage extends StatefulWidget {
  @override
  _SimpleHttpPageState createState() => _SimpleHttpPageState();
}

class _SimpleHttpPageState extends State<SimpleHttpPage> {
  List<UserModel> listData = [];

  getDataServer() async {
    var res = await http.get("https://jsonplaceholder.typicode.com/posts");
    if (this.mounted) {
      setState(() {
        listData = userModelFromJson(res.body);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Http Request User Post")),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int position) {
            UserModel mappingServer = listData[position];
            return Container(
                child: Card(
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Id : ${mappingServer.id}"),
                    Text(mappingServer.title,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(mappingServer.body, style: TextStyle(fontSize: 11)),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
