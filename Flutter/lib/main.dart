import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './detail.dart';
import './tambahData.dart';

void main() {
  runApp(new MaterialApp(
    title: "CRUD_Web_Flutter",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<List> ambilData() async{
    final response = await http.get("http://192.168.0.200/crud_web_flutter/ctrl/ambil_data.php?flutter");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("CRUD_Web_Flutter"),),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=> Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context) => new AddData(),
            )
        ),
      ),
      body: new FutureBuilder<List>(
        future: ambilData(),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data,)
              : new Center(child: new CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          padding: const EdgeInsets.all(0.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new Detail(list: list, index: i)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text("Nama : ${list[i]['nama']}", style: new TextStyle(fontSize: 20.0),),
                leading: new Text(list[i]['id'], style: new TextStyle(fontSize: 30.0),),
                subtitle: new Text("NIM : ${list[i]['nim']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
