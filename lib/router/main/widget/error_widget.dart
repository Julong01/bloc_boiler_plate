import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_event.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_state.dart';
import 'package:flutter_bloc_boiler_plate/ui/common/appbar_widget.dart';

class ErrorPresentWidget extends StatelessWidget {
  const ErrorPresentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImageHorizontalBloc, ImageHorizontalState>(
      listener: (context, state) {
        if (!state.isError) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: appBar(title: "Horizontal scroll Error"),
        body: Center(
          child: IconButton(
              iconSize: 100,
              onPressed: () {
                HapticFeedback.mediumImpact();
                context
                    .read<ImageHorizontalBloc>()
                    .add(ImageHorizontalEventInit());
              },
              icon: const Icon(Icons.refresh_rounded)),
        ),
      ),
    );
  }
}
