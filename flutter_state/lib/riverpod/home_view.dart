import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state/riverpod/joke.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Joke Generator')),
      body: SizedBox.expand(
        //화면 꽉 채우기
        child: Consumer(
          builder: (context, ref, child) {
            final randomJoke = ref.watch(randomJokeProvider);
            return Stack(
              alignment: Alignment.center,
              children: [
                switch (randomJoke) {
                  AsyncValue(:final value?) => SelectableText(
                    '${value.setup}\n\n${value.punchline}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  AsyncValue(error: != null) => const Text(
                    'error fetching joke',
                  ),
                  AsyncValue() => const CircularProgressIndicator(),
                },
                if (randomJoke.isRefreshing)
                  Positioned(
                    bottom: 20,
                    child: ElevatedButton(
                      onPressed: () => ref.invalidate(randomJokeProvider),
                      child: const Text('Get another joke'),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
