import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'game/fly_game.dart';

Future main() async {

  // Setup the flame utility
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  // Create the Game and run the app
  FlyGame game = FlyGame();
  runApp(game.widget);
  
  TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
  tapGestureRecognizer.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapGestureRecognizer);
}

