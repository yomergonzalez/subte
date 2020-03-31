import 'package:flutterapp/models/subte_alerts.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SubteAlertsState {
  List<Entity> entities = [];
  String message;
}

class InitialSubteAlertsState extends SubteAlertsState {}

class LoadingSubteAlertsState extends SubteAlertsState {}

class FailSubteAlertsState extends SubteAlertsState {}
