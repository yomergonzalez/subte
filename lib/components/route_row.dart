import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/subte_alerts/subte_alerts_bloc.dart';
import 'package:flutterapp/bloc/subte_alerts/subte_alerts_state.dart';
import 'package:flutterapp/models/subte_alerts.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

class RouteRow extends StatelessWidget {
  final String route;

  const RouteRow({Key key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Linea ",
                  style: TextStyle(fontSize: 20),
                ),
                Image.asset(this.route + ".png"),
              ],
            ),
          ),
          _serviceAlert()
        ],
      ),
    );
  }

  Widget _serviceAlert() {
    return Center(
      child: BlocBuilder<SubteAlertsBloc, SubteAlertsState>(
          builder: (context, state) {
          if (state is LoadingSubteAlertsState) {
            return  Loading(
                indicator: BallSpinFadeLoaderIndicator(),
                size: 20.0,
                color: Colors.amber);
          }

          var res = _filterEntity(state.entities);

          if (res != null) {
            return Row(
              children: <Widget>[
                Container(margin: EdgeInsets.all(3),child: Icon(Icons.warning, color: Colors.limeAccent)),
                Flexible(
                    child: Text(res,
                        style: TextStyle(color: Colors.red, fontSize: 12)))
              ],
            );
          }

          return Container();
      }),
    );
  }

  String _filterEntity(List<Entity> entities) {

    if (entities.isEmpty) return null;

    Entity enti = entities.firstWhere((entity) {
      return (entity.alert.informedEntity[0].routeId == this.route);
    });

    return enti.alert.headerText.translation[0].text;
  }
}
