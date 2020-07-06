import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rusty Pi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Rusty Pi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _launchKodi() async{
    var url = "http://192.168.20.9:8000/kodi";
    await http.get(url);
  }
  Widget _buildButton(String title, Widget leading){
    return Card(
      color: Colors.grey[700],
      child: ListTile(
        
        contentPadding: EdgeInsets.all(10),
        leading: leading,
        title: Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
        onTap: () {
          _launchKodi();
          },
      ),
    );
  }

  Widget _buildButtonList(){
    return ListView(
      children: <Widget>[
        _buildButton("POWER ON", Icon(Icons.power_settings_new, size: 40, color: Colors.white)),
        _buildButton("RUN KODI", Image.asset('assets/images/kodi_logo.png', width: 40))
      ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // appBar: AppBar(
      //   title: Text(widget.title, style: TextStyle(color: Colors.white)),
      //   backgroundColor: Colors.grey[800],
      // ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: _buildButtonList()
        )
      )
    );
  }
}
