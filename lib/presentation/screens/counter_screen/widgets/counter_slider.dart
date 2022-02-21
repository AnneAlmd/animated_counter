import 'package:counter_animated/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterSlider extends StatefulWidget {
  const CounterSlider({
    Key? key,
  }) : super(key: key);

  @override
  _Stepper2State createState() => _Stepper2State();
}

class _Stepper2State extends State<CounterSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  late double _startAnimationPosX;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, lowerBound: -0.5, upperBound: 0.5);
    _controller.value = 0.0;
    _controller.addListener(() {});

    _animation = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(1.5, 0.0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animation = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(1.5, 0.0))
        .animate(_controller);
  }

  // !test = init();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: 260.0,
        height: 80.0,
        child: Material(
          type: MaterialType.canvas,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(60.0),
          color: Colors.white.withOpacity(0.2),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              const Positioned(
                left: 10.0,
                child: Icon(Icons.remove, size: 40.0, color: Colors.white),
              ),
              const Positioned(
                right: 10.0,
                child: Icon(Icons.add, size: 40.0, color: Colors.white),
              ),
              GestureDetector(
                onHorizontalDragStart: _onPanStart,
                onHorizontalDragUpdate: _onPanUpdate,
                onHorizontalDragEnd: _onPanEnd,
                child: SlideTransition(
                  position: _animation,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      shape: const CircleBorder(),
                      elevation: 5.0,
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                child: child, scale: animation);
                          },
                          child: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double offsetFromGlobalPos(Offset globalPosition) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset local = box.globalToLocal(globalPosition);
    _startAnimationPosX = ((local.dx * 0.75) / box.size.width) - 0.4;

    return ((local.dx * 0.75) / box.size.width) - 0.4;
  }

  void _onPanStart(DragStartDetails details) {
    _controller.stop();
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    _controller.stop();

    if (_controller.value <= -0.20) {
      context.read<CounterCubit>().decrement();
    } else if (_controller.value >= 0.20) {
      context.read<CounterCubit>().increment();
    }

    final SpringDescription _kDefaultSpring =
        SpringDescription.withDampingRatio(
      mass: 0.9,
      stiffness: 250.0,
      ratio: 0.6,
    );

    _controller.animateWith(
        SpringSimulation(_kDefaultSpring, _startAnimationPosX, 0.0, 0.0));
  }
}
