import 'package:counter_animated/presentation/screens/counter_screen/widgets/counter_slider.dart';
import 'package:flutter/material.dart';

import 'widgets/animated_circle.dart';
import 'widgets/plasma_background.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const PlasmaBackground(),
          // ignore: avoid_print
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.15,
            child: CounterSlider(
              initialValue: 0,
              onChanged: (int value) => print('new value $value'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: const AnimatedCircle(),
          ),
        ],
      ),
    );
  }
}
