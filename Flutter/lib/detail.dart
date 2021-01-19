import 'package:flutter/material.dart';
import 'package:crud_web_flutter/main.dart';
import './editData.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {

  final List list;
  final int index;
  Detail({this.index,this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void hapusData(){
    var url = "http://192.168.0.200/crud_web_flutter/ctrl/hapus_data.php?flutter";
    http.post(url, body: {
      'id' : widget.list[widget.index]['id']
    });
  }

  void Konfirmasi(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Ingin Menghapus '${widget.list[widget.index]['nama']}'"),

      actions: [
        new RaisedButton(
            child: new Text("Ya"),
            color: Colors.red,
            onPressed: () {
              hapusData();
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp()));
            }
        ),
        new RaisedButton(
          child: new Text("Tidak"),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['id']}"),),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(widget.list[widget.index]['id'], style: new TextStyle(fontSize: 40.0),),
                new Text("Nama : ${widget.list[widget.index]['nama']}", style: new TextStyle(fontSize: 20.0),),
                new Text("NIM : ${widget.list[widget.index]['nim']}", style: new TextStyle(fontSize: 20.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Edit"),
                      color: Colors.green,
                      onPressed: ()=> Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                        ),
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("Haous"),
                      color: Colors.red,
                      onPressed: ()=> Konfirmasi(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
