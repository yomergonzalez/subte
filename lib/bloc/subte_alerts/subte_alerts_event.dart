import 'package:flutterapp/models/subte_alerts.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SubteAlertsEvent {}

class SubteAlertsLoadingEvent extends SubteAlertsEvent {}

class SubteAlertsSuccessEvent extends SubteAlertsEvent {
  List<Entity> entities;
  SubteAlertsSuccessEvent(this.entities);
}

class SubteAlertsFailEvent extends SubteAlertsEvent {
  final String message;
  SubteAlertsFailEvent(this.message);
}