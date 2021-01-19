import 'package:flutter/material.dart';
import 'package:crud_web_flutter/main.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {

  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerNama;
  TextEditingController controllerNIM;

  void editData(){
    var url = "http://192.168.0.200/crud_web_flutter/ctrl/edit_data.php?flutter";
    http.post(url, body: {
      "id" : widget.list[widget.index]['id'],
      "nama" : controllerNama.text,
      "nim" : controllerNIM.text,
    });
  }

  @override
  void initState() {
    controllerNama = new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerNIM = new TextEditingController(text: widget.list[widget.index]['nim']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Data Mahasiswa"),),
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
                  child: new Text("Edit Data"),
                  color: Colors.blueAccent,
                  onPressed: (){
                    editData();
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
