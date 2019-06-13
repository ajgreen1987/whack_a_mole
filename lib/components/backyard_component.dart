import '../game/fly_game.dart';
import 'package:flame/sprite.dart';
import 'base_component.dart';
import 'dart:ui';

class Backyard extends BaseComponent {
  final FlyGame game;
  Sprite bgSprite;
  Rect bgRect;

  Backyard(this.game) : super(game) {
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
    bgSprite = Sprite('bg/backyard.png');
  }

  @override
  void render(Canvas canvas) {
    bgSprite.renderRect(canvas, bgRect);
    super.render(canvas);
  }
}
