import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/subte_trips.dart';
import 'package:flutterapp/pages/subte_schedule.dart';

class SubteWagonsPage extends StatelessWidget {
  final List<Entity> entitiesFiltered;
  final int directionSelected;

  const SubteWagonsPage(
      {Key key, this.entitiesFiltered, this.directionSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de Vagones"),
      ),
      body: Column(
        children: <Widget>[
          _buildList()
        ],
      ),
    );
  }

  _buildList() {
    var wagons = _filterWagons();

    return Flexible(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext cont, int index) {
        return Card(
            child: GestureDetector(
          onTap: () => Navigator.push(cont, MaterialPageRoute(builder: (BuildContext context) => SubteSchedulePage(entity:wagons[index]))),
          child: Container(
            height: 50,
            child: Text("Vagon ID: "+wagons[index].iD+ " - Fecha inicio: "+ wagons[index].linea.startDate),
          ),
        ));
      },
      itemCount: wagons.length,
    ));
  }

  List<Entity> _filterWagons() {
    return entitiesFiltered.where((entity) {
      return (entity.linea.directionID == directionSelected);
    }).toList();
  }
}
