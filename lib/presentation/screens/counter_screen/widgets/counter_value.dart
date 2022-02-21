import 'package:flutter/material.dart';
import 'package:counter_animated/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

// ignore: must_be_immutable
class CounterValue extends StatefulWidget {
  const CounterValue({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterValue> createState() => _CounterValueState();
}

class _CounterValueState extends State<CounterValue>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0.0);
    return ZoomIn(
      duration: const Duration(milliseconds: 400),
      manualTrigger: true,
      controller: (controller) {
        animationController = controller;
      },
      child: Text(
        context
            .select((CounterCubit cubit) => cubit.state.counterValue)
            .toString(),
        style: Theme.of(context).textTheme.headline1!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
