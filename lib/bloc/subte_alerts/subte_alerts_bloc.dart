import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterapp/models/subte_alerts.dart';
import 'package:flutterapp/services/subte_service.dart';
import './bloc.dart';

class SubteAlertsBloc extends Bloc<SubteAlertsEvent, SubteAlertsState> {
  @override
  SubteAlertsState get initialState => InitialSubteAlertsState();
  SubteService _subteService = new SubteService();

  @override
  Stream<SubteAlertsState> mapEventToState(
    SubteAlertsEvent event,
  ) async* {

    if (event is SubteAlertsLoadingEvent) {
      yield LoadingSubteAlertsState();
    }
    if (event is SubteAlertsSuccessEvent) {
      var init = InitialSubteAlertsState();
      init.entities = event.entities;
      yield init;
    }
    if (event is SubteAlertsFailEvent) {
        this.getAlerts();
    }
  }


  void getAlerts() {
    print("busca");
    add(SubteAlertsLoadingEvent());
    _subteService.allAlerts().then((value) {
      add(SubteAlertsSuccessEvent(value.entity));
    }).catchError((error) {
      add(SubteAlertsFailEvent("Ha ocurrido un error al solicitar la información. Presione refrescar."));
    });
  }

}
