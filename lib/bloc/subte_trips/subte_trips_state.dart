import 'package:flutterapp/models/subte_trips.dart';
import 'package:meta/meta.dart';

abstract class SubteTripsState {
  List<Entity> entitys = [];
  String message;
}

class InitialSubteTripsState extends SubteTripsState {}

class LoadingSubteTripsState extends SubteTripsState {}

class FailedSubteTripsState extends SubteTripsState {}