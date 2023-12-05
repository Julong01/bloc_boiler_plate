import 'package:flutter_bloc/flutter_bloc.dart';

class AppObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    //bloc 생성 시점
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    //bloc 상태 변경 시점 => emit(state)
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    //bloc 이벤트 호출 시점 => add(event)
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    //bloc 이벤트나 상태가 추가,변경되어 state가 업데이트되기전 시점
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    //bloc에서 stacktrace에 해당하는 에러를 발생할때, stacktrace를 거치지 않는 에러일 경우 empty
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    //bloc 제거 시점
    super.onClose(bloc);
  }
}
