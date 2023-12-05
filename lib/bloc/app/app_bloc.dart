import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/app/app_event.dart';
import 'package:flutter_bloc_boiler_plate/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  /*
    app에 전역 상태 관리에 필요한 값들을 정의합니다.
    session이나 toastmsg, alert 등
  */
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerStateKey;
  AppBloc()
      : _scaffoldMessengerStateKey = GlobalKey<ScaffoldMessengerState>(),
        super(AppState()) {
    on<AppEventRebuild>((event, emit) => emit(AppState()));
    on<AppEventCover>((event, emit) => cover(event.cover, emit));
  }
  // 전역 설정에서 비동기 통신 동안 프로그래스를 나타내는 상태 관리
  cover(bool on, Emitter<AppState> emit) {
    if (on) {
      print("COVER ON");
      emit(AppLoadingState());
    } else {
      print("COVER OFF");
      emit(AppLoadedState());
    }
  }

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerStateKey =>
      _scaffoldMessengerStateKey;
}
