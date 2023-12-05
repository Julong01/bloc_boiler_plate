import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ImageVerticalEvent extends Equatable {}

class ImageVerticalEventInit extends ImageVerticalEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ImageVerticalEventMore extends ImageVerticalEvent {
  final ScrollUpdateNotification notification;
  ImageVerticalEventMore(this.notification);
  @override
  // TODO: implement props
  List<Object?> get props => [notification];
}
