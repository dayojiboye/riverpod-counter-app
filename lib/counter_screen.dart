import 'package:flutter/material.dart';
import 'package:riverpod_counter_app/providers/counter_provider.dart';
import 'package:riverpod_counter_app/touchable_opacity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      backgroundColor: const Color(0xffBDB3AE),
      appBar: AppBar(
        title: const Text("Riverpod Counter App"),
        backgroundColor: const Color(0xff7A7684),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TouchableOpacity(
              onTap: () {
                ref.read(counterProvider.notifier).onIncrease();
              },
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff7A7684),
              ),
              width: 80,
              height: 80,
              child: const Icon(
                Icons.plus_one,
                color: Colors.white,
                size: 30,
              ),
            ),
            TouchableOpacity(
              onTap: () {
                ref.read(counterProvider.notifier).onDecrease();
              },
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff7A7684),
              ),
              width: 80,
              height: 80,
              child: const Icon(
                Icons.exposure_minus_1,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "$counter",
          style: const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
