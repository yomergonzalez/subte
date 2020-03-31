import 'dart:convert';

class SubteTrips {
  List<Entity> entity;

  SubteTrips({this.entity});

  SubteTrips.fromJson(Map<String, dynamic> json) {
    if (json['Entity'] != null) {
      entity = new List<Entity>();
      json['Entity'].forEach((v) {
        entity.add(new Entity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entity != null) {
      data['Entity'] = this.entity.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entity {
  String iD;
  Linea linea;

  Entity({this.iD, this.linea});

  Entity.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    linea = json['Linea'] != null ? new Linea.fromJson(json['Linea']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    if (this.linea != null) {
      data['Linea'] = this.linea.toJson();
    }
    return data;
  }
}

class Linea {
  String tripId;
  String routeId;
  int directionID;
  String startTime;
  String startDate;
  List<Estaciones> estaciones;

  Linea(
      {this.tripId,
        this.routeId,
        this.directionID,
        this.startTime,
        this.startDate,
        this.estaciones});

  Linea.fromJson(Map<String, dynamic> json) {
    tripId = json['Trip_Id'];
    routeId = json['Route_Id'];
    directionID = json['Direction_ID'];
    startTime = json['start_time'];
    startDate = json['start_date'];
    if (json['Estaciones'] != null) {
      estaciones = new List<Estaciones>();
      json['Estaciones'].forEach((v) {
        estaciones.add(new Estaciones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Trip_Id'] = this.tripId;
    data['Route_Id'] = this.routeId;
    data['Direction_ID'] = this.directionID;
    data['start_time'] = this.startTime;
    data['start_date'] = this.startDate;
    if (this.estaciones != null) {
      data['Estaciones'] = this.estaciones.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Estaciones {
  String stopId;
  String stopName;
  Arrival arrival;
  Arrival departure;

  Estaciones({this.stopId, this.stopName, this.arrival, this.departure});

  Estaciones.fromJson(Map<String, dynamic> json) {
    stopId = json['stop_id'];
    stopName = json['stop_name'];
    arrival =
    json['arrival'] != null ? new Arrival.fromJson(json['arrival']) : null;
    departure = json['departure'] != null
        ? new Arrival.fromJson(json['departure'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stop_id'] = this.stopId;
    data['stop_name'] = this.stopName;
    if (this.arrival != null) {
      data['arrival'] = this.arrival.toJson();
    }
    if (this.departure != null) {
      data['departure'] = this.departure.toJson();
    }
    return data;
  }
}

class Arrival {
  int time;
  int delay;

  Arrival({this.time, this.delay});

  Arrival.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    delay = json['delay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['delay'] = this.delay;
    return data;
  }
}
