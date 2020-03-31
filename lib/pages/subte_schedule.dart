import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/components/layout_widgets.dart';
import 'package:flutterapp/components/station_row.dart';
import 'package:flutterapp/models/subte_trips.dart';
import 'package:flutterapp/services/params.dart';

class SubteSchedulePage extends StatelessWidget {

  final Entity entity;

  const SubteSchedulePage({Key key, this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _color = Params.colorsStations[entity.linea.routeId];

    return Scaffold(
      appBar: LayoutWidgets.appBar("Horarios", [],color: _color),
      backgroundColor: Colors.white,
      body: Container(
        child:
          Stack(
            children: <Widget>[
              Container(
                width: 30,
                color: _color,
                margin: EdgeInsets.only(left: 20),
              ),
              Column(
                children: <Widget>[
                  _buildList()
                ],
              )
            ],
          ),
      ),
      );
  }

  _buildList() {

    var color = Params.colorsStations[entity.linea.routeId];
    var estaciones = entity.linea.estaciones;

    return Flexible(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext cont, int index) {
            return StationRow(
              station: estaciones[index],
              color: color,
            );
          },
          itemCount: estaciones.length,
        ));
  }

  void d (){
   // DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
  }

}
