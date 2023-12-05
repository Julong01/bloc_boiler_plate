import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_vertical/image_vertical_event.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_vertical/image_vertical_state.dart';
import 'package:flutter_bloc_boiler_plate/model/image_models.dart';

import '../../../api/api.dart';

class ImageVerticalBloc extends Bloc<ImageVerticalEvent, ImageVerticalState> {
  final Api _api;
  ImageVerticalBloc()
      : _api = Api(Dio()),
        super(const ImageVerticalState()) {
    on<ImageVerticalEventInit>(_init);
    on<ImageVerticalEventMore>(_more);
  }

  _init(ImageVerticalEvent event, Emitter<ImageVerticalState> emit) async {
    List<ImageData>? response = await _api.getImages(state.pageNo, 10);
    if (response != null) {
      emit(state.copyWith(
          imageList: response,
          pageNo: state.pageNo + 1,
          type: VerticalImageType.loaded));
    } else {
      emit(state.copyWith(message: "Error"));
    }
  }

  _more(ImageVerticalEventMore event, Emitter<ImageVerticalState> emit) async {
    if (event.notification.metrics.maxScrollExtent * 0.9 <
            event.notification.metrics.pixels &&
        state.type != VerticalImageType.more) {
      emit(state.copyWith(type: VerticalImageType.more));
      List<ImageData>? response = await _api.getImages(state.pageNo, 10);
      if (response != null) {
        emit(state.copyWith(
            imageList: [...state.imageList!, ...response],
            pageNo: state.pageNo + 1));
        Future.delayed(const Duration(milliseconds: 1000),
            () => emit(state.copyWith(type: VerticalImageType.more)));
      } else {
        emit(state.copyWith(message: "Error"));
      }
    }
  }
}
