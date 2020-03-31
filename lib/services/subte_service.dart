import 'dart:convert';
import 'package:flutterapp/models/subte_alerts.dart';
import 'package:flutterapp/models/subte_trips.dart';
import 'package:flutterapp/services/params.dart';
import 'package:http/http.dart' as http;

class SubteService {


  Future<SubteTrips> allTrips() async {
    var client = http.Client();
    try {
      var url = Params.url + "subtes/forecastGTFS?client_id="+ Params.clientId+"&client_secret="+Params.tokenId;
      var uriResponse = await client.get(url);
      var body = jsonDecode(uriResponse.body);

      if(body["message"]!= null){
        throw Exception();
      }
      return SubteTrips.fromJson(body);
    } finally {
      client.close();
    }
  }



  Future<SubteAlerts> allAlerts() async {
    var client = http.Client();
    try {
      var url = Params.url + "subtes/serviceAlerts?json=1&client_id="+ Params.clientId+"&client_secret="+Params.tokenId;
      var uriResponse = await client.get(url);
      var body = jsonDecode(uriResponse.body);
      if(body["message"]!= null){
        throw Exception();
      }
      return SubteAlerts.fromJson(body);
    } finally {
      client.close();
    }
  }


}