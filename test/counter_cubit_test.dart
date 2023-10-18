import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:learning_flutter_app/presentation/counter/cubit/counter_cubit.dart';

void main() {
  group("counter cubit test", () {
    blocTest<CounterCubit, int>(
      'emits [MyState] when MyEvent is added.',
      build: () => CounterCubit(),
      act: (cubit) => cubit
        ..decrement()
        ..increment()
        ..decrement(),
      expect: () => const <int>[-1,0,-1],
    );
    blocTest<CounterCubit, int>(
      'emits [MyState] when MyEvent is added.',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => const <int>[-1],
    );
  });
}
