import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/subte_trips/subte_trips_bloc.dart';
import 'package:flutterapp/bloc/subte_trips/subte_trips_state.dart';
import 'package:flutterapp/components/layout_widgets.dart';
import 'package:flutterapp/components/title_container.dart';
import 'package:flutterapp/models/subte_trips.dart';
import 'package:flutterapp/pages/subte_schedule.dart';
import 'package:flutterapp/pages/subte_wagons.dart';
import 'package:flutterapp/services/params.dart';

class SubteCategoryListPage extends StatelessWidget {
  final String category;
  Map<int, String> destinos = {};
  List<Entity> entitysFiltered = [];

  SubteCategoryListPage({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final SubteTripsBloc bloc = BlocProvider.of<SubteTripsBloc>(context);

    destinos = filterDirection(bloc.state.entitys);

    return Scaffold(
      appBar: LayoutWidgets.appBar(this.category.replaceAll("Linea", "Linea "), []),
      backgroundColor: Colors.grey,
      body: LayoutWidgets.containerBackground(
           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TitleContainer(
                  title: "Trayecto"
              ),
              Flexible(
                  child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext cont, int index) =>
                    buildBody(cont, index),
                itemCount: destinos.length,
              )),
            ],
          ),
      ),
    );
  }

  buildBody(BuildContext ctxt, int index) {
    return GestureDetector(
      onTap: (){
        var filtered = _filterWagons(index);
        Navigator.push(ctxt, MaterialPageRoute(builder: (BuildContext context) => SubteSchedulePage(entity: filtered[0],)));
      },
      child: Card(
        margin: EdgeInsets.only(left: 20,right: 20, bottom: 10),
        elevation: 2,
        child: Container(
          height: 50,
          child: Center(
              child: Text(destinos[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              )
          ),
        ),
      ),
    );
  }

  Map<int, String> filterDirection(List<Entity> entitys) {

    List<int> destiny = new List<int>();

    entitys.fold(destiny, (p, e) {
      if (e.linea.routeId == this.category) {
        entitysFiltered.add(e);
        if (!destiny.contains(e.linea.directionID)) {
          destiny.add(e.linea.directionID);
        }
      }
    });

    Map<int,String> destines = new Map();

    destiny.forEach((i) {
       destines[i] =Params.directions[this.category][i].toString();
    });

    return destines;
  }

  List<Entity> _filterWagons(direction) {
    return entitysFiltered.where((entity) {
      return (entity.linea.directionID == direction);
    }).toList();
  }
}
