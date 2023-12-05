import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_bloc.dart';
import 'package:flutter_bloc_boiler_plate/router/home_view.dart';
import 'package:flutter_bloc_boiler_plate/router/splash_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/app/app_bloc.dart';
import '../bloc/app/app_state.dart';
import '../bloc/splash/splash_bloc.dart';

class AppView extends StatelessWidget {
  AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context2, state) {
        return MaterialApp(
          localizationsDelegates: context2.localizationDelegates,
          supportedLocales: context2.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: "BlocPlate",
          locale: context2.locale,
          builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  highContrast: false,
                  boldText: false,
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: ScreenUtilInit(
                  useInheritedMediaQuery: true,
                  designSize: const Size(360, 780),
                  builder: (_, child) {
                    if (child != null) {
                      return ScaffoldMessenger(
                          key:
                              context.read<AppBloc>().scaffoldMessengerStateKey,
                          child: Stack(
                            children: [
                              child,
                              if (state is AppLoadingState)
                                const Center(
                                  child: CircularProgressIndicator(),
                                )
                            ],
                          ));
                    } else {
                      return const SizedBox();
                    }
                  },
                  child: child,
                ));
          },
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case "/":
                return CupertinoPageRoute(
                    settings: settings,
                    builder: (context) => BlocProvider<SplashBloc>(
                          create: (context) => SplashBloc(),
                          child: const SplashView(),
                        ));
              // case "home":
              //   return CupertinoPageRoute(
              //       settings: settings,
              //       builder: (context) => MultiBlocProvider(providers: providers, child: child)BlocProvider<HomeBloc>(
              //             create: (context) => HomeBloc(),
              //             child: HomeView(),
              //           ));
            }
          },
        );
      },
    );
  }
}
