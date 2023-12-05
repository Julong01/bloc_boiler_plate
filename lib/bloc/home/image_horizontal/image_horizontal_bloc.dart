import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_event.dart';
import 'package:flutter_bloc_boiler_plate/bloc/home/image_horizontal/image_horizontal_state.dart';
import 'package:flutter_bloc_boiler_plate/model/image_models.dart';

import '../../../api/api.dart';

class ImageHorizontalBloc
    extends Bloc<ImageHorizontalEvent, ImageHorizontalState> {
  final Api _api;
  ImageHorizontalBloc()
      : _api = Api(Dio()),
        super(ImageHorizontalInitState()) {
    on<ImageHorizontalEventInit>(_init);
    on<ImageHorizontalEventMore>(_more);
  }

  _init(ImageHorizontalEvent event, Emitter<ImageHorizontalState> emit) async {
    emit(ImageHorizontalErrorState(isError: state.isError));
    List<ImageData>? response = await _api.getImages(state.pageNo, 10);
    if (response != null) {
      emit(ImageHorizontalLoadedState(
          imageList: response, pageNo: state.pageNo + 1));
    } else {
      emit(const ImageHorizontalErrorState(isError: true, imageList: []));
    }
  }

  _more(ImageHorizontalEvent event, Emitter<ImageHorizontalState> emit) async {
    if (state is ImageHorizontalLoadedState) {
      List<ImageData>? response = await _api.getImages(state.pageNo, 10);
      if (response != null) {
        emit(ImageHorizontalLoadedState(
            imageList: [...state.imageList!, ...response]));
      } else {
        emit(const ImageHorizontalErrorState(isError: true, imageList: []));
      }
    }
  }
}
