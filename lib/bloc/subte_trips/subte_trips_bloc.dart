import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterapp/services/subte_service.dart';
import './bloc.dart';

class SubteTripsBloc extends Bloc<SubteTripsEvent, SubteTripsState> {
  @override
  SubteTripsState get initialState => InitialSubteTripsState();
  SubteService _subteService = new SubteService();

  @override
  Stream<SubteTripsState> mapEventToState(
    SubteTripsEvent event,
  ) async* {

    if (event is SubteTripsLoadingEvent) {
      yield LoadingSubteTripsState();
    }
    if (event is SubteTripsSuccessEvent) {
      var init = InitialSubteTripsState();
      init.entitys = event.entitys;
      yield init;
    }
    if (event is SubteTripsFailEvent) {
      var fail = FailedSubteTripsState();
      fail.message = event.message;
      yield fail;
    }
  }

  void getTrips() {
    add(SubteTripsLoadingEvent());

    _subteService.allTrips().then((value) {
      add(SubteTripsSuccessEvent(value.entity));
    }).catchError((error) {
      add(SubteTripsFailEvent("Ha ocurrido un error al solicitar la información. Presione refrescar."));
    });
  }
}
