part of 'counter_cubit.dart';

class CounterState {
  final int counterValue;

  CounterState({required this.counterValue});

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue']?.toInt() ?? 0,
    );
  }

  @override
  String toString() => 'CounterState(counterValue: $counterValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterState && other.counterValue == counterValue;
  }

  @override
  int get hashCode => counterValue.hashCode;
}
