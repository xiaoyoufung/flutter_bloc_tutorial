import 'package:bloc_tutorial/bloc/counter_bloc.dart';
import 'package:bloc_tutorial/cubit/counter_cubit.dart';
import 'package:bloc_tutorial/cubit/increment_decrement_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterBloc, int>(
                    bloc: counterBloc,
                    builder: (context, counter) {
                      return  Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const IncrementDecrementPage()));
            },
            child: const Icon(Icons.navigate_next),
          ),
        );
  }
}
