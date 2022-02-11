import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AnimatedCircle extends StatelessWidget {
  const AnimatedCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.60,
      width: MediaQuery.of(context).size.width * 0.60,
      child: FlareActor(
        'assets/flares/circle.flr',
        animation: 'Alarm',
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
