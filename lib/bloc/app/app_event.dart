class AppEvent {}

class AppEventRebuild extends AppEvent {}

class AppEventCover extends AppEvent {
  final bool cover;
  AppEventCover(this.cover);
}
