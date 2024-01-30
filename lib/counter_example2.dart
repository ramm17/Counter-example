import 'package:counter_example/cubit/counter_cubit.dart';
import 'package:counter_example/cubit/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterExample2 extends StatefulWidget {
  const CounterExample2({
    super.key,
  });

  @override
  State<CounterExample2> createState() => _CounterExample2State();
}

class _CounterExample2State extends State<CounterExample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example 2"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state is CounterLoadingState) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if(state is CounterSuccessState) {
                  return Text(
                    '${state.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
              // BlocProvider.of<CounterCubit>(context).decrement();
            },
            heroTag: UniqueKey(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
              // BlocProvider.of<CounterCubit>(context).increment();
            },
            heroTag: UniqueKey(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
