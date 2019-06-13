import 'dart:ui';

import 'base_component.dart';
import 'package:flame/sprite.dart';

class Fly extends BaseComponent {
  Fly(game, [baseRect, bgColor]) : super(game, baseRect, bgColor);

  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  void render(Canvas c){
    if(isDead){
      deadSprite.renderRect(c, componentRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, componentRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      componentRect = componentRect.translate(0, game.tileSize * 24 * t);
    }
    super.update(t);
  }

  // Tap logic belongs in subclass
  void onTapDown() {
    //componentPaint.color = Color(0xffff4757);
    isDead = true;
  }
}
