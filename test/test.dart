import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // bloc test code
  // 유닛 테스트를 통해 bloc 기능이 제대로 동작하는지 확인하는 작업을 진행
  group("Test Group", () {
    late HomeBloc homeBloc;
    setUp(() => homeBloc = HomeBloc());
    test("initial state is 0", () => expect(homeBloc.state, 0));
    blocTest("emit count add",
        build: () => homeBloc,
        act: (bloc) => bloc.add(HomeEventCal(1)),
        expect: () => [1]);
    blocTest("emit count sub",
        build: () => homeBloc,
        act: (bloc) => bloc.add(HomeEventCal(-1)),
        expect: () => [-1]);
  });
}
