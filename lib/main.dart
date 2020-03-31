import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/subte_alerts/bloc.dart';
import 'package:flutterapp/bloc/subte_trips/bloc.dart';
import 'package:flutterapp/pages/subte_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers:[
          BlocProvider<SubteTripsBloc>(
            create: (BuildContext context) => SubteTripsBloc(),
          ),
          BlocProvider<SubteAlertsBloc>(
            create: (BuildContext context) => SubteAlertsBloc(),
          )
        ],
        child: MaterialApp(
            title: 'Subte App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SubteListPage()
        ),
      );
  }
}