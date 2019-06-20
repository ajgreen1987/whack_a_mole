import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'game/fly_game.dart';
import 'package:flame/flame.dart';

Future main() async {
  // Setup the flame utility
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  // Move this elsewhere
  Flame.images.loadAll(<String>[
    'bg/backyard.png',
    'flies/agile-fly-1.png',
    'flies/agile-fly-2.png',
    'flies/agile-fly-dead.png',
    'flies/drooler-fly-1.png',
    'flies/drooler-fly-2.png',
    'flies/drooler-fly-dead.png',
    'flies/house-fly-1.png',
    'flies/house-fly-2.png',
    'flies/house-fly-dead.png',
    'flies/hungry-fly-1.png',
    'flies/hungry-fly-2.png',
    'flies/hungry-fly-dead.png',
    'flies/macho-fly-1.png',
    'flies/macho-fly-2.png',
    'flies/macho-fly-dead.png',
    'bg/lose-splash.png',
    'branding/title.png',
    'ui/dialog-credits.png',
    'ui/dialog-help.png',
    'ui/icon-credits.png',
    'ui/icon-help.png',
    'ui/start-button.png',
  ]);

  // Create the Game and run the app
  FlyGame game = FlyGame();
  runApp(game.widget);

  TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
  tapGestureRecognizer.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapGestureRecognizer);
}
