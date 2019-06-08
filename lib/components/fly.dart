// TODO: change to import 'baseComponent.dart'
import 'package:whack_a_mole/components/baseComponent.dart';
import 'dart:ui';

class Fly extends BaseComponent {
  Fly(game, x, y, [bgColor = const Color(0xff6ab04c)])
      : super(game, x, y, bgColor);

  void update(double t) {
    if (isDead) {
      componentRect = componentRect.translate(0, game.tileSize * 12 * t);
    }
    super.update(t);
  }

  // Tap logic belongs in subclass
  void onTapDown() {
    componentPaint.color = Color(0xffff4757);
    isDead = true;
  }
}
