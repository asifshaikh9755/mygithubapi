import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, @required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://api.github.com/users";
  List data;
  var _loading = false;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    print(response);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
                child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    data[index]['login'],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  subtitle: Text(data[index]['url']),
                ),
              ],
            ));
          }),
    );
  }
}
