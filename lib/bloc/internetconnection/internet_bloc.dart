import 'dart:async';

import 'package:bloc_connect/bloc/internetconnection/internet_event.dart';
import 'package:bloc_connect/bloc/internetconnection/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Internetbloc extends Bloc<Internetevent, Internetstate> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connetivitySubscription;
  Internetbloc() : super(Internetinitial()) {
    on<Lostinternetevent>((event, emit) => emit(Internetloststate()));
    on<Powerinternetevent>((event, emit) => emit(Internetgainstate()));
    connetivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(Powerinternetevent());
      } else {
        add(Lostinternetevent());
      }
    });
  }
  @override
  Future<void> close() {
    connetivitySubscription?.cancel();
    return super.close();
  }
}
