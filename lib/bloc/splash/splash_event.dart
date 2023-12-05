import 'package:flutter/cupertino.dart';

class SplashEvent {}

class SplashEventNextScreen extends SplashEvent {
  final BuildContext _context;
  SplashEventNextScreen(this._context);
  BuildContext get context => _context;
}
