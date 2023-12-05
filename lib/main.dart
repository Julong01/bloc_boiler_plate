import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/app/app_bloc_observer.dart';
import 'package:flutter_bloc_boiler_plate/router/app_view.dart';

import 'bloc/app/app_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppObserver();
  runApp(EasyLocalization(
      path: "assets/translations",
      fallbackLocale: const Locale("ko"),
      supportedLocales: const [Locale("ko"), Locale("en")],
      startLocale: const Locale("en"),
      child: BlocProvider<AppBloc>(
        create: (context) => AppBloc(),
        child: AppView(),
      )));
}
