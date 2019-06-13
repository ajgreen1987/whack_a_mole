import 'package:flame/sprite.dart';
import '../components/fly_component.dart';
import '../game/fly_game.dart';

class HouseFly extends Fly {
  HouseFly(FlyGame game, [baseRect, bgColor]) : super(game, baseRect, bgColor) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }
}