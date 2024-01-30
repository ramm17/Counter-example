import 'package:counter_example/counter_example2.dart';
import 'package:counter_example/cubit/counter_cubit.dart';
import 'package:counter_example/cubit/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
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
            TextButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<CounterCubit>(),
                        child: CounterExample2(),
                      ),
                    ),
                  );
                },
                child: const Text("GoTo Page 2"))
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
