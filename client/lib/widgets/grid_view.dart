

//--- TESTING ATM NOT SURE WHAT LAYOUT TO GO WITH HMM... ---//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  // Widget _generateGrid(){
  //   return GridView.count(
  //     crossAxisCount: 2,
  //     children: <Widget>[
  //       _buildGridButton("POWER ON", Icon(Icons.power_settings_new, size: 40, color: Colors.white), _powerOn),
  //       _buildGridButton("RUN KODI", Image.asset('assets/images/kodi_logo.png', width: 40, height: 40,), (){_launchKodi();}),
  //       _buildGridButton("TEST ESP SENSOR", Image.asset('assets/images/espressif_logo.png', width: 40, height: 40), (){ _testEspSensor();})
        
  //     ]
  //   );
  // }
