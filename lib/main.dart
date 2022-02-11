import 'package:counter_animated/logic/cubit/theme_cubit.dart';
import 'package:counter_animated/logic/debug/app_bloc_observer.dart';
import 'package:counter_animated/counter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubit/counter_cubit.dart';

void main() async {
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: AppBlocObserver(),
  );
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(
      const App(),
    ),
    storage: storage,
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      ],
      child: const CounterApp(),
    );
  }
}
