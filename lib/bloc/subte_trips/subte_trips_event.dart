import 'package:flutterapp/models/subte_trips.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SubteTripsEvent {}

class SubteTripsLoadingEvent extends SubteTripsEvent {}

class SubteTripsSuccessEvent extends SubteTripsEvent {
  final List<Entity> entitys;
  SubteTripsSuccessEvent(this.entitys);
}

class SubteTripsFailEvent extends SubteTripsEvent {
  final String message;
  SubteTripsFailEvent(this.message);
}