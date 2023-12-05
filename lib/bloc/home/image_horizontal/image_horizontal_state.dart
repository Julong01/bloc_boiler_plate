import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_boiler_plate/model/image_models.dart';

abstract class ImageHorizontalState extends Equatable {
  final int pageNo;
  final List<ImageData>? imageList;
  final bool isError;
  const ImageHorizontalState(
      {this.pageNo = 0, this.imageList, this.isError = false});
}

class ImageHorizontalInitState extends ImageHorizontalState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ImageHorizontalDownloadedState extends ImageHorizontalState {
  const ImageHorizontalDownloadedState({super.isError});
  @override
  // TODO: implement props
  List<Object?> get props => [isError];
}

class ImageHorizontalLoadedState extends ImageHorizontalState {
  const ImageHorizontalLoadedState({super.imageList, super.pageNo});
  @override
  // TODO: implement props
  List<Object?> get props => [imageList, pageNo];
}

class ImageHorizontalMoreState extends ImageHorizontalState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ImageHorizontalErrorState extends ImageHorizontalState {
  const ImageHorizontalErrorState({super.imageList, super.isError});
  @override
  // TODO: implement props
  List<Object?> get props => [imageList, isError];
}
