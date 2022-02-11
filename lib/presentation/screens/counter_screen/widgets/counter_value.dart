import 'package:flutter/material.dart';
import 'package:counter_animated/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterValue extends StatelessWidget {
  const CounterValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context
          .select((CounterCubit cubit) => cubit.state.counterValue)
          .toString(),
      style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
