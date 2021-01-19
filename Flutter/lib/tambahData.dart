import 'package:flutter/material.dart';
import 'package:crud_web_flutter/main.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerNIM = new TextEditingController();

  void tambahData(){
    var url = "http://192.168.0.200/crud_web_flutter/ctrl/tambah_data.php?flutter";
    http.post(url, body: {
      "nama" : controllerNama.text,
      "nim" : controllerNIM.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Tambah Data Mahasiswa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller : controllerNama,
                  decoration: new InputDecoration(
                      hintText: "nama",
                      labelText: "nama"
                  ),
                ),
                new TextField(
                  controller : controllerNIM,
                  decoration: new InputDecoration(
                      hintText: "NIM",
                      labelText: "NIM"
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0),),
                new RaisedButton(
                  child: new Text("Tambah Data"),
                  color: Colors.blueAccent,
                  onPressed: (){
                    tambahData();
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
