import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_boiler_plate/model/image_models.dart';

enum VerticalImageType {
  loading,
  more,
  loaded,
}

class ImageVerticalState extends Equatable {
  final int pageNo;
  final List<ImageData>? imageList;
  final String? message;
  final VerticalImageType type;
  const ImageVerticalState(
      {this.pageNo = 30,
      this.imageList,
      this.type = VerticalImageType.loading,
      this.message});

  ImageVerticalState copyWith(
      {final List<ImageData>? imageList,
      final String? message,
      final VerticalImageType? type,
      final int? pageNo}) {
    return ImageVerticalState(
        imageList: imageList ?? this.imageList,
        type: type ?? this.type,
        message: message ?? this.message,
        pageNo: pageNo ?? this.pageNo);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [pageNo, imageList, message, type];
}
