import 'package:counter_animated/logic/cubit/theme_cubit.dart';
import 'package:counter_animated/logic/debug/app_bloc_observer.dart';
import 'package:counter_animated/counter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: AppBlocObserver(),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: const CounterApp(),
    );
  }
}
