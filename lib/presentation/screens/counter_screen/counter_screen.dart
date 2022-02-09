import 'package:counter_animated/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                stops: const [
                  0,
                  1,
                ],
              ),
              backgroundBlendMode: BlendMode.srcOver,
            ),
            child: PlasmaRenderer(
              type: PlasmaType.bubbles,
              particles: 13,
              color: Theme.of(context).particlesColor,
              blur: 0.30,
              size: 0.20,
              speed: 0.86,
              offset: 0,
              blendMode: BlendMode.screen,
              particleType: ParticleType.atlas,
              variation1: 0.31,
              variation2: 0.3,
              variation3: 0.13,
              rotation: 1.05,
            ),
          ),
        ],
      ),
    );
  }
}
