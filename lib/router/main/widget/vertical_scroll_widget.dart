import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_vertical/image_vertical_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_vertical/image_vertical_event.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_vertical/image_vertical_state.dart';

class VerticalScrollWidget extends StatelessWidget {
  const VerticalScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageVerticalBloc, ImageVerticalState>(
      listener: (context, state) {
        if (state.message != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: AutoSizeText(
                state.message!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )));
        }
      },
      builder: (BuildContext context, ImageVerticalState state) {
        if (state.type == VerticalImageType.loading) {
          return const Expanded(
              child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          ));
        } else {
          return Expanded(
              child: NotificationListener<ScrollUpdateNotification>(
            onNotification: (notification) {
              context
                  .read<ImageVerticalBloc>()
                  .add(ImageVerticalEventMore(notification));
              return false;
            },
            child: ListView.builder(
                itemCount: state.imageList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              color: const Color.fromRGBO(91, 91, 91, 1),
                              child: CachedNetworkImage(
                                imageUrl: state.imageList![index].downloadUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                                child: Container(
                              height: 100,
                              color: const Color.fromRGBO(91, 91, 91, 1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _textWidget(state.imageList![index].id),
                                  _textWidget(state.imageList![index].author),
                                  _textWidget(
                                      state.imageList![index].width.toString()),
                                  _textWidget(state.imageList![index].height
                                      .toString()),
                                ],
                              ),
                            ))
                          ],
                        ),
                        if (index + 1 == state.imageList!.length)
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: state.type == VerticalImageType.more
                                ? const CircularProgressIndicator(
                                    color: Colors.cyan,
                                  )
                                : const SizedBox(),
                          )
                      ],
                    ),
                  );
                }),
          ));
        }
      },
    );
  }

  Padding _textWidget(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 12),
      child: AutoSizeText(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
