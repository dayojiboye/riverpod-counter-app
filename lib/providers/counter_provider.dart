import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // initial data

  // increase counter
  void onIncrease() {
    state += 1;
  }

  // decrease counter
  void onDecrease() {
    if (state <= 0) return;
    state -= 1;
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});
