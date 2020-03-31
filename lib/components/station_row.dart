import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/subte_trips.dart';

class StationRow extends StatelessWidget {

  final Estaciones station;
  final Color color;

  StationRow({Key key, @required this.station, @required this.color});

  @override
  Widget build(BuildContext context) {

    var date =  DateTime.fromMillisecondsSinceEpoch(this.station.arrival.time * 1000);

    String minutes = date.minute<10? '0'+date.minute.toString() : date.minute.toString();

    return Card(
        elevation: 0,
        color: Colors.transparent,
        margin: EdgeInsets.only(left: 25, bottom: 20),
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(Icons.remove_circle,color: Colors.white,size: 19,),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: Text(station.stopName ,
                      style: TextStyle(color: this.color, fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30,
                        child: Text("Llegada: " + date.hour.toString()+ ":"+minutes,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),),
                      ),
                      Divider()
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
