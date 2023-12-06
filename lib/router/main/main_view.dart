import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_state.dart';
import 'package:flutter_bloc_boiler_plate/ui/element/main/error_widget.dart';
import 'package:flutter_bloc_boiler_plate/ui/element/main/horizontal_scroll_widget.dart';
import 'package:flutter_bloc_boiler_plate/ui/element/main/vertical_scroll_widget.dart';
import 'package:flutter_bloc_boiler_plate/ui/common/appbar_widget.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImageHorizontalBloc, ImageHorizontalState>(
      listener: (context, state) {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (_) => BlocProvider.value(
                  value: context.read<ImageHorizontalBloc>(),
                  child: const ErrorPresentWidget(),
                )));
      },
      listenWhen: (previous, current) {
        if (!previous.isError) {
          return current.isError;
        } else {
          return false;
        }
      },
      child: Scaffold(
        appBar: appBar(title: "Infinity Image"),
        body: const Column(
          children: [
            SizedBox(
              height: 20,
            ),
            HorizontalScrollWidget(),
            SizedBox(
              height: 20,
            ),
            VerticalScrollWidget()
          ],
        ),
      ),
    );
  }
}
