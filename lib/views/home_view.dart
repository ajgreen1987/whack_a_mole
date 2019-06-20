import 'dart:ui';
import 'package:flame/sprite.dart';
import '../components/base_component.dart';
import '../game/fly_game.dart';

class HomeView extends BaseComponent{
  Rect titleRect;
  Sprite titleSprite;

  HomeView(FlyGame game) : super(game) {
    titleRect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 4),
      game.tileSize * 7,
      game.tileSize * 4,
    );
    titleSprite = Sprite('branding/title.png');
  }

  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);
  }

  void update(double t) {}
}
