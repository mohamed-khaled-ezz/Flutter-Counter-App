import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_cubit.dart';
import '../blocs/theme_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter'),
        actions: [
          IconButton(
            onPressed: () =>
                context.read<ThemeBloc>().add(ThemeTogglePressed()),
            icon: const Icon(Icons.brightness_6),
            tooltip: 'Toggle theme',
          ),
        ],
      ),
      body: BlocListener<CounterCubit, int>(
        listenWhen: (previous, current) => current < 0,
        listener: (context, count) {
          showDialog<void>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Negative counter'),
              content: Text('The counter is now $count.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Current count'),
              BlocBuilder<CounterCubit, int>(
                builder: (context, count) {
                  return Text(
                    '$count',
                    style: Theme.of(context).textTheme.displayLarge,
                  );
                },
              ),
              const SizedBox(height: 24),
              BlocConsumer<CounterCubit, int>(
                listenWhen: (previous, current) =>
                    current == 10 || current == -10,
                listener: (context, count) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Counter reached $count')),
                  );
                },
                builder: (context, count) {
                  return Column(
                    children: [
                      Text(count < 0 ? 'Below zero' : 'Zero or above'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.filled(
                            onPressed: context.read<CounterCubit>().decrement,
                            icon: const Icon(Icons.remove),
                            tooltip: 'Decrement',
                          ),
                          const SizedBox(width: 16),
                          IconButton.filled(
                            onPressed: context.read<CounterCubit>().increment,
                            icon: const Icon(Icons.add),
                            tooltip: 'Increment',
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
