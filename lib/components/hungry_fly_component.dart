import 'package:flame/sprite.dart';
import '../components/fly_component.dart';
import '../game/fly_game.dart';

class HungryFly extends Fly {
  HungryFly(FlyGame game, [baseRect, bgColor]) : super(game, baseRect, bgColor) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}