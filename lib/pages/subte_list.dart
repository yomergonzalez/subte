import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/subte_alerts/subte_alerts_bloc.dart';
import 'package:flutterapp/bloc/subte_trips/bloc.dart';
import 'package:flutterapp/components/layout_widgets.dart';
import 'package:flutterapp/components/route_row.dart';
import 'package:flutterapp/components/title_container.dart';
import 'package:flutterapp/models/subte_trips.dart';
import 'package:flutterapp/pages/subte_category_list.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

class SubteListPage extends StatelessWidget {
  List<String> entitys = [];


  @override
  Widget build(BuildContext context) {

    _getTrips(){
      BlocProvider.of<SubteTripsBloc>(context).getTrips();
      BlocProvider.of<SubteAlertsBloc>(context).getAlerts();
    }


    _getTrips();

    return Scaffold(
      backgroundColor: Colors.grey,
      drawerScrimColor: Colors.black54,
      appBar: LayoutWidgets.appBar(
        "Subte",
        <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: (){
                  if(BlocProvider.of<SubteTripsBloc>(context).state is LoadingSubteTripsState){
                    print("loading");
                    return null;
                  }
                  _getTrips();
                },
                child: Icon(
                  Icons.refresh,
                  size: 26.0,
                  color: Colors.black54,
                ),
              ))
        ],
      ),
      drawer: LayoutWidgets.drawer(),
      body: LayoutWidgets.containerBackground(
         Column(
          children: <Widget>[
            TitleContainer(
                title: "Rutas disponibles"
            ),
            BlocBuilder<SubteTripsBloc, SubteTripsState>(
                builder: (context, state) {
              if (state is LoadingSubteTripsState) {
                return Column(
                  children: <Widget>[
                    Loading(
                        indicator: BallSpinFadeLoaderIndicator(),
                        size: 70.0,
                        color: Colors.amber),
                    Container(
                      color: Colors.amber,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      child: Text("Consultando...",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                );
              }

              if (state is FailedSubteTripsState) {
                Timer(Duration(seconds: 1), () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ));
                });
              }

              entitys = GroupTrips(state.entitys);

              return Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext cont, int index) =>
                      buildBody(cont, index),
                  itemCount: entitys.length,
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  buildBody(BuildContext ctxt, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
          ctxt,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  SubteCategoryListPage(category: entitys[index]))),
      child: Card(
        margin: EdgeInsets.only(left: 20,right: 20, bottom: 10),
        child: RouteRow(route: entitys[index]),
      ),
    );
  }

  List<String> GroupTrips(List<Entity> entitys) {
    List<String> lineas = new List<String>();

    if (entitys == null) {
      entitys = new List<Entity>();
    }
    entitys.fold(lineas, (p, e) {
      if (lineas.contains(e.linea.routeId)) {
      } else {
        lineas.add(e.linea.routeId);
      }
    });

    return lineas;
  }
}
