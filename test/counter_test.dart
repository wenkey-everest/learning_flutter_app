import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter_app/presentation/providers/counter_provider.dart';

void main() {
  group("Provider tests", () {
    test("Check increment in provider", () {
      final counterProvider = CounterProvider();
      counterProvider.number = 0;
      expect(counterProvider.number, 0);
      counterProvider.increment();
      expect(counterProvider.number, 1);
      counterProvider.decrement();
      expect(counterProvider.number, 0);
    });
  });
}
