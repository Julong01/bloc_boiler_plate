import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/splash/splash_event.dart';

import '../../bloc/splash/splash_bloc.dart';
import '../../bloc/splash/splash_state.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(SplashEventNextScreen(context));
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return PopScope(
            canPop: false,
            child: Scaffold(
              body: CachedNetworkImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1498462440456-0dba182e775b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfhx8fGVufDB8fHx8fA%3D%3D",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ) // child: SliderMe
            );
      },
    );
  }
}
