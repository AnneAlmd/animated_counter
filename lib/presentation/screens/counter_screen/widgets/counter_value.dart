import 'package:flutter/material.dart';

class CounterValue extends StatelessWidget {
  const CounterValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '8',
      style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
