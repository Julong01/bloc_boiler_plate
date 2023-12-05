import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/splash/splash_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/splash/splash_state.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return PopScope(
            canPop: false,
            child: Scaffold(
                body: Stack(
              children: [
                Center(
                  child: Text('count_title'.tr() + state.toString()),
                ),
                Positioned(
                    bottom: 30,
                    right: 30,
                    child: Container(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                      child: IconButton(
                        onPressed: () => {},
                        //context.read<SplashBloc>().add(HomeEventCal(1)),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 30,
                    left: 30,
                    child: Container(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                      child: IconButton(
                        onPressed: () => {},
                        //context.read<HomeBloc>().add(HomeEventCal(-1)),
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            )));
      },
    );
  }
}
