import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_event.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_state.dart';

class HorizontalScrollWidget extends StatelessWidget {
  const HorizontalScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageHorizontalBloc, ImageHorizontalState>(
      builder: (context, state) {
        if (state is ImageHorizontalInitState ||
            state is ImageHorizontalDownloadedState) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                context
                    .read<ImageHorizontalBloc>()
                    .add(ImageHorizontalEventInit());
              },
              child: Icon(
                state is ImageHorizontalDownloadedState
                    ? Icons.download_done_rounded
                    : Icons.download_rounded,
                size: 50,
              ),
            ),
          );
        } else {
          return SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: state.imageList?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (state.imageList == null) {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: const Color.fromRGBO(71, 71, 71, 1),
                          child: CachedNetworkImage(
                            imageUrl: state.imageList![index].downloadUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (index + 1 == state.imageList!.length) ...[
                          GestureDetector(
                            onTap: () {
                              HapticFeedback.mediumImpact();
                              context
                                  .read<ImageHorizontalBloc>()
                                  .add(ImageHorizontalEventMore());
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: state is ImageHorizontalMoreState
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.amber,
                                    ))
                                  : const Icon(
                                      Icons.add_circle_outline_rounded,
                                      size: 50,
                                    ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}
