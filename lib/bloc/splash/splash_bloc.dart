import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/app/app_event.dart';
import 'package:flutter_bloc_boiler_plate/bloc/splash/splash_event.dart';
import 'package:flutter_bloc_boiler_plate/bloc/splash/splash_state.dart';

import '../app/app_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashEventNextScreen>((event, emit) => _next(event, emit));
  }

  _next(SplashEventNextScreen event, Emitter<SplashState> emit) {
    event.context.read<AppBloc>().add(AppEventCover(true));
    Future.delayed(const Duration(milliseconds: 3000), () {
      event.context.read<AppBloc>().add(AppEventCover(false));
      Navigator.pushReplacementNamed(event.context, "home");
    });
  }
}
