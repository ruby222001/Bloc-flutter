//just for UI
import 'package:bloc_prac/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decremnt(),
            child: Icon(Icons.remove),
          ),
        ],
      ),
      // BlocBuilder] handles building a widget in response to new states
      body: BlocBuilder<CounterCubit, int>(builder: (context, state) {
        return Center(
          child: Text(
            state.toString(),
            style: TextStyle(fontSize: 20),
          ),
        );
      }),
    );
  }
}
