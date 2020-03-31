import 'dart:convert';

class SubteAlerts {
  List<Entity> entity;

  SubteAlerts({this.entity});

  SubteAlerts.fromJson(Map<String, dynamic> json) {
    if (json['entity'] != null) {
      entity = new List<Entity>();
      json['entity'].forEach((v) {
        entity.add(new Entity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entity != null) {
      data['entity'] = this.entity.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entity {
  String id;
  bool isDeleted;
  Null tripUpdate;
  Null vehicle;
  Alert alert;

  Entity({this.id, this.isDeleted, this.tripUpdate, this.vehicle, this.alert});

  Entity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDeleted = json['is_deleted'];
    tripUpdate = json['trip_update'];
    vehicle = json['vehicle'];
    alert = json['alert'] != null ? new Alert.fromJson(json['alert']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_deleted'] = this.isDeleted;
    data['trip_update'] = this.tripUpdate;
    data['vehicle'] = this.vehicle;
    if (this.alert != null) {
      data['alert'] = this.alert.toJson();
    }
    return data;
  }
}

class Alert {
  List<Null> activePeriod;
  List<InformedEntity> informedEntity;
  int cause;
  int effect;
  Null url;
  HeaderText headerText;
  HeaderText descriptionText;

  Alert(
      {this.activePeriod,
        this.informedEntity,
        this.cause,
        this.effect,
        this.url,
        this.headerText,
        this.descriptionText});

  Alert.fromJson(Map<String, dynamic> json) {
    if (json['active_period'] != null) {
      activePeriod = new List<Null>();
    }
    if (json['informed_entity'] != null) {
      informedEntity = new List<InformedEntity>();
      json['informed_entity'].forEach((v) {
        informedEntity.add(new InformedEntity.fromJson(v));
      });
    }
    cause = json['cause'];
    effect = json['effect'];
    url = json['url'];
    headerText = json['header_text'] != null
        ? new HeaderText.fromJson(json['header_text'])
        : null;
    descriptionText = json['description_text'] != null
        ? new HeaderText.fromJson(json['description_text'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activePeriod != null) {
    }
    if (this.informedEntity != null) {
      data['informed_entity'] =
          this.informedEntity.map((v) => v.toJson()).toList();
    }
    data['cause'] = this.cause;
    data['effect'] = this.effect;
    data['url'] = this.url;
    if (this.headerText != null) {
      data['header_text'] = this.headerText.toJson();
    }
    if (this.descriptionText != null) {
      data['description_text'] = this.descriptionText.toJson();
    }
    return data;
  }
}

class InformedEntity {
  String agencyId;
  String routeId;
  int routeType;
  Null trip;
  String stopId;

  InformedEntity(
      {this.agencyId, this.routeId, this.routeType, this.trip, this.stopId});

  InformedEntity.fromJson(Map<String, dynamic> json) {
    agencyId = json['agency_id'];
    routeId = json['route_id'];
    routeType = json['route_type'];
    trip = json['trip'];
    stopId = json['stop_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agency_id'] = this.agencyId;
    data['route_id'] = this.routeId;
    data['route_type'] = this.routeType;
    data['trip'] = this.trip;
    data['stop_id'] = this.stopId;
    return data;
  }
}

class HeaderText {
  List<Translation> translation;

  HeaderText({this.translation});

  HeaderText.fromJson(Map<String, dynamic> json) {
    if (json['translation'] != null) {
      translation = new List<Translation>();
      json['translation'].forEach((v) {
        translation.add(new Translation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.translation != null) {
      data['translation'] = this.translation.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translation {
  String text;
  String language;

  Translation({this.text, this.language});

  Translation.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['language'] = this.language;
    return data;
  }
}
