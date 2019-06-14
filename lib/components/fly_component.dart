import 'dart:ui';

import 'base_component.dart';
import 'package:flame/sprite.dart';

class Fly extends BaseComponent {
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
  double get speed => game.tileSize * 3;
  Offset targetLocation;

  Fly(game, [baseRect, bgColor]) : super(game, baseRect, bgColor) {
    setTargetLocation();
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, componentRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()]
          .renderRect(c, componentRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      componentRect = componentRect.translate(0, game.tileSize * 24 * t);
    } else {
      // Maybe create methods in the base (move & animate?)
      flyAround(t);
      animate(t);
    }
    super.update(t);
  }

  // Tap logic belongs in subclass
  void onTapDown() {
    //componentPaint.color = Color(0xffff4757);
    isDead = true;
  }

  void flyAround(t) {
    double stepDistance = speed * t;
    Offset toTarget =
        targetLocation - Offset(componentRect.left, componentRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget =
          Offset.fromDirection(toTarget.direction, stepDistance);
      componentRect = componentRect.shift(stepToTarget);
    } else {
      componentRect = componentRect.shift(toTarget);
      setTargetLocation();
    }
  }

  void setTargetLocation() {
    double x = game.random.nextDouble() *
        (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.random.nextDouble() *
        (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void animate(t) {
    flyingSpriteIndex += 30 * t;
    if (flyingSpriteIndex >= 2) {
      flyingSpriteIndex -= 2;
    }
  }
}
