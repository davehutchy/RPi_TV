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

 TextEditingController editingController = TextEditingController();
  String _filter;

  Widget getFilter(){
    return Container(
      margin: EdgeInsets.fromLTRB(20,60, 20, 0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text("Search for configured controls", style: TextStyle(color: Colors.white))),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  this._filter = value;
                });
              },
              //TODO: DO SOMETHING WITH BORDER COLOR... HMM
              controller: editingController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                  labelText: "Filter",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear), 
                    onPressed: ()  {
                      editingController.clear();
                      this._filter = null;
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
            )
          )
        ]
      ),
    );    
  }

  void _launchKodi() async{
    //var url = "http://192.168.20.9:8000/kodi";
    //await http.get(url);
  }

  void _powerOn(){
    //TODO: HACK DLINK PLUG
  }

  void _garageDoor(){
    //TODO: GET YARD STICK ONE AND HACK GARRAGE DOOR
  }

  void _testEspSensor() async{
    var url = "http://192.168.20.55/test";
    await http.get(url);
  }

  Widget _buildListButton(String title, Widget leading, Function onTap){
    return Container(
      margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Card(
        color: Colors.grey[700],
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: leading,
          title: Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
          onTap: onTap
        ),
      ),
    );
  }

  Widget _buildGridButton(String title, Widget leading, Function onTap){
       return Card(
      color: Colors.grey[700],
      child: GridTile(
        header: leading,
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
        //onTap: onTap
      ),
    );
  }

  Widget _generateGrid(){
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        _buildGridButton("POWER ON", Icon(Icons.power_settings_new, size: 40, color: Colors.white), _powerOn),
        _buildGridButton("RUN KODI", Image.asset('assets/images/kodi_logo.png', width: 40, height: 40,), (){_launchKodi();}),
        _buildGridButton("TEST ESP SENSOR", Image.asset('assets/images/espressif_logo.png', width: 40, height: 40), (){ _testEspSensor();})
        
      ]
    );
  }


  Widget _getList(){
    return Center(
      child: Container(
        decoration: BoxDecoration(
         // border: Border.all(color: Colors.blueAccent)
        ),
        child: ListView(
          children: <Widget>[
            _buildListButton("POWER ON", Icon(Icons.power_settings_new, size: 40, color: Colors.white), (){_powerOn();}),
            _buildListButton("RUN KODI", Image.asset('assets/images/kodi_logo.png', width: 40), (){_launchKodi();}),
            _buildListButton("TEST ESP SENSOR", Image.asset('assets/images/espressif_logo.png', width: 40), (){ _testEspSensor();}),
            _buildListButton("GARAGE DOOR", Image.asset('assets/images/gsg_logo.png', width: 40), (){ _garageDoor();})
          ])
      )
    );
  }

  void _openConfiguration(){
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // appBar: AppBar(
      //   title: Text(widget.title, style: TextStyle(color: Colors.white)),
      //   backgroundColor: Colors.grey[800],
      // ),
      body:  Container(
          child: Column(
            children: <Widget>[
              getFilter(),
              Expanded( child: _getList()),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Text("rusty_pi v1.0.0.0", style: TextStyle(color: Colors.white))
              )
            ]
          )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[600],
          child: Icon(Icons.settings, color: Colors.white),
          onPressed: _openConfiguration,
        ),
    );
  }
}
